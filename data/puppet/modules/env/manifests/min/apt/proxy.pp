class env::min::apt::proxy {

  file {
    '/etc/apt/apt.conf.d/proxy-guess':
      mode    => 644,
      owner   => root,
      group   => root,
      source  => 'puppet:///modules/env/min/apt/apt_proxy-guess';
  }

}
