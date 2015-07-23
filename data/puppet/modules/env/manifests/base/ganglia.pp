class env::base::ganglia ($enable = false){

  package {
    'ganglia-monitor':
      ensure  => installed;
  }

  file {
    '/etc/ganglia' :
      ensure  => directory,
      owner   => root,
      group   => root,
      mode    => '0644';
    '/etc/ganglia/gmond.conf' :
      ensure  => file,
      owner   => root,
      group   => root,
      mode    => '0644',
      source  => "puppet:///modules/env/base/ganglia/gmond.conf",
      require => File['/etc/ganglia'];
  }

  service {
    'ganglia-monitor':
      enable  => $enable,
      require => Package['ganglia-monitor'];
  }

}
