class env::min::packages ($architecture = 'amd64') {

  # Some packages to add
  $editors = [ 'vim', 'nano' ]
  $utils = [ 'less' ]

  $installed = [ $editors, $utils ]

  package {
    $installed:
      ensure => installed;
  }
}

