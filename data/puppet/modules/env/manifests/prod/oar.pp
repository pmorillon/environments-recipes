# Define to allow an array call with unknown number of argument.
define my_sshkey_file {
  $key_list   = hiera("env::prod::oar::ssh")
  $key_values = $key_list["${name}"]

  file {
    "/var/lib/oar/.ssh/oarnodesetting_ssh_${name}.key":
      ensure   => file,
      owner    => oar,
      group    => oar,
      mode     => '0600',
      content  => $key_values['oarnodesetting_ssh_key'];
    "/var/lib/oar/.ssh/oarnodesetting_ssh_${name}.key.pub":
      ensure   => file,
      owner    => oar,
      group    => oar,
      mode     => '0644',
      content  => $key_values['oarnodesetting_ssh_key_pub'];
    "/var/lib/oar/.ssh/id_rsa_${name}":
      ensure   => file,
      owner    => oar,
      group    => oar,
      mode     => '0600',
      content  => $key_values['id_rsa'];
    "/var/lib/oar/.ssh/id_rsa_${name}.pub":
      ensure   => file,
      owner    => oar,
      group    => oar,
      mode     => '0644',
      content  => $key_values['id_rsa_pub'];
  }
}


class env::prod::oar {

  # Setup oar repos
  include 'env::prod::oar::apt'

  $oar_packages = ['oar-common', 'oar-node']
  package {
    ['oar-common', 'oar-node']:
      ensure   => installed;
  }

  file {
    '/var/lib/oar/checklogs/':
      ensure   => directory,
      owner    => root,
      group    => root,
      mode     => '0755',
      require  => Package[$oar_packages];
    '/var/lib/oar/.ssh':
      ensure   => directory,
      owner    => root,
      group    => root,
      mode     => '0755',
      require  => Package[$oar_packages];
    '/var/lib/oar/.ssh/config':
      ensure   => present,
      owner    => oar,
      group    => oar,
      mode     => '0644',
      source   => 'puppet:///modules/env/prod/oar/oar_sshclient_config',
      require  => [ File['/var/lib/oar/.ssh'], Package[$oar_packages] ];
    '/etc/oar/oar_ssh_host_dsa_key':
      ensure   => present,
      owner    => root,
      group    => root,
      mode     => '0600',
      source   => 'puppet:///modules/env/prod/oar/oar_ssh_host_dsa_key',
      require  => Package[$oar_packages];
    '/etc/oar/oar_ssh_host_rsa_key':
      ensure   => present,
      owner    => root,
      group    => root,
      mode     => '0600',
      source   => 'puppet:///modules/env/prod/oar/oar_ssh_host_rsa_key',
      require  => Package[$oar_packages];
    '/etc/oar/oar_ssh_host_dsa_key.pub':
      ensure   => present,
      owner    => root,
      group    => root,
      mode     => '0600',
      source   => 'puppet:///modules/env/prod/oar/oar_ssh_host_dsa_key.pub',
      require  => Package[$oar_packages];
    '/etc/oar/oar_ssh_host_rsa_key.pub':
      ensure   => present,
      owner    => root,
      group    => root,
      mode     => '0600',
      source   => 'puppet:///modules/env/prod/oar/oar_ssh_host_rsa_key.pub',
      require  => Package[$oar_packages];
    '/var/lib/oar/.batch_job_bashrc':
      ensure   => present,
      owner    => oar,
      group    => oar,
      mode     => '0755',
      source   => 'puppet:///modules/env/prod/oar/batch_job_bashrc',
      require  => Package[$oar_packages];
    '/etc/security/access.conf':
      ensure   => present,
      owner    => root,
      group    => root,
      mode     => '0644',
      source   => 'puppet:///modules/env/prod/oar/access.conf',
      require  => Package[$oar_packages];
    '/etc/oar/sshd_config':
      ensure   => present,
      owner    => root,
      group    => root,
      mode     => '0644',
      source   => 'puppet:///modules/env/prod/oar/sshd_config',
      require  => Package[$oar_packages];
    '/var/lib/oar/.ssh/authorized_keys':
      ensure   => present,
      owner    => oar,
      group    => oar,
      mode     => '0644',
      source   => 'puppet:///modules/env/prod/oar/oar_authorized_keys',
      require  => Package[$oar_packages];
  }

  if $target_g5k {
    file {
      '/etc/default/oar-node':
        ensure   => present,
        owner    => root,
        group    => root,
        mode     => '0644',
        source   => 'puppet:///modules/env/prod/oar/default_oar-node';
    }
  } else {
    # List all file with a stored oarnodesetting key in hiera
    $oarnodesetting_ssh = keys( hiera("env::prod::oar::ssh") )
    file {
      '/etc/default/oar-node':
        ensure   => present,
        owner    => root,
        group    => root,
        mode     => '0644',
        source   => 'puppet:///modules/env/prod/oar/default_oar-node_site';
    }
    my_sshkey_file { $oarnodesetting_ssh: }
  }
}
