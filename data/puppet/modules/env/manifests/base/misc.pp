class env::base::misc {

  # Don't delete /tmp on reboot
  file {
    '/etc/tmpfiles.d/tmp.conf':
      ensure => 'link',
      target => '/dev/null';
  }
}
