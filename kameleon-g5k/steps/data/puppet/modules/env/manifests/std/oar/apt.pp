class env::std::oar::apt {

  file {
    '/etc/apt/sources.list.d/oar.list':
      ensure  => file,
      mode    => '0644',
      owner   => root,
      group   => root,
      content => "# oar
deb http://oar-ftp.imag.fr/oar/2.5/debian/ ${::lsbdistcodename} main",
      notify  => Exec['/usr/bin/apt-get update'];
  }

# Already declared in nfs/ceph/apt.pp
#  exec {
#    '/usr/bin/apt-get update':
#      refreshonly => true;
#  }
}
