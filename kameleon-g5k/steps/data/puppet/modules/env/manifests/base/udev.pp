# This file complete udev setup for infiniband. Udev is supposed to be installed by min variant
class env::base::udev (){

  file {
    '/lib/udev/rules.d/90-ib.rules':
      ensure  => present,
      owner   => root,
      groop   => root,
      mode    => '0644',
      source  => 'puppet:///modules/env/base/udev/90-ib.rules',
      require => Package['udev'];
  }
}
