class env::nfs::ntp {

  ntp = [ 'ntp', 'ntpdate' ]
  package {
    $ntp:
      ensure    =>  installed,
  }

  # INCOMPLETE

