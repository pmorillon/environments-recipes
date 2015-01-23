class env::min::misc {

  if $target_g5k {
    $root_pwd = hiera("env::min::misc::rootpwd")
  }
  else {
    $root_pwd = '$1$qzZwnZXQ$Ak1xs7Oma6HUHw/xDJ8q91' # grid5000
  }

  # Set root password
  user {
    'root':
      ensure   => 'present',
      password => $root_pwd;
  }

  # Set timezone
  file {
    '/etc/localtime':
      ensure   => present,
      source   => '/usr/share/zoneinfo/Europe/Paris';
  }

  # Use bash as default shell
  file {
    '/bin/sh':
      ensure => 'link',
      target => '/bin/bash',
  }
}
