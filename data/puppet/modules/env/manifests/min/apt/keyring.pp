class env::min::apt::keyring {

  package {
    "${operatingsystem}-keyring":
      ensure => installed;
    "${operatingsystem}-archive-keyring":
      ensure => installed;
  }

}
