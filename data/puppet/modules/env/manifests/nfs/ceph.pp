class env::nfs::ceph (
  $version = 'firefly'
) {

  # Add ceph repositorie
  # case $operatingsystem {
  #   'Debian': {
  #     class {
  #       'env::nfs::ceph::apt':
  #         version => $version;
  #     }
  #   }
  #   default: {
  #     err "${operatingsystem} not suported."
  #   }
  # }

  # Install ceph

  package {
    'ceph':
      ensure => installed;
  }

  # Ensure service does not start at boot
  service {
    'ceph':
      enable  => false,
      require => Package['ceph'];
  }

  # Class['env::nfs::ceph::apt'] -> Package['ceph']

}

