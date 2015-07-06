class env::nfs::ntp ( $drift_file = nil ) {

  $ntp = [ 'ntp', 'ntpdate' ]
  package {
    $ntp:
      ensure    =>  installed,
  }

  file {
    '/etc/ntp.conf':
      ensure    => file,
      owner     => root,
      group     => root,
      mode      => 0644,
      content   => template("env/nfs/ntp/ntp.conf.erb"),
      notify    => Service['ntp'];
  }

  unless $drift_file == nil {
    file {
      '/var/lib/ntp/ntp.drift':
        ensure    => file,
        owner     => ntp,
        group     => ntp,
        mode      => 0644,
        content   => "";
    }
  }

  service {
    'ntp':
      enable    => true;
  }
}
