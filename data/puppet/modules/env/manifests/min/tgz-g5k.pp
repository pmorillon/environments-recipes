class env::min::tgz-g5k {
  case $operatingsystem {
    'Debian','Ubuntu': {
      exec{'retrieve_tgz-g5k_deb':
        command => "/usr/bin/wget -q https://www.grid5000.fr/packages/debian/tgz-g5k_all.deb -O /tmp/tgz-g5k_all.deb",
        creates => "/tmp/tgz-g5k_all.deb",
      }
      package {
        'tgz-g5k':
          ensure   => installed,
          provider => dpkg,
          source   => '/tmp/tgz-g5k_all.deb',
          require  =>  [
              Exec['retrieve_tgz-g5k_deb'],
              Package['ssh client']
          ]
      }
    }
    default: {
      err "${operatingsystem} not suported."
    }
  }
}

