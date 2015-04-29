class env::min::apt::proxy {

  file {
    '/etc/apt/apt.conf.d/g5k-proxy':
      mode    => 644,
      owner   => root,
      group   => root,
      source  => 'puppet:///modules/env/min/apt/g5k-proxy';
  }

}
