# This file contains the 'min' class used to configure an environment with minimal modification to be executed in grid'5000.

class env::min (){

  # Package manager
  case $operatingsystem {
    'Debian','Ubuntu': {
      include 'env::min::apt'
    }
    'Centos': {
      include 'env::min::yum'
    }
    default: {
      err "${operatingsystem} not suported."
    }
  }

  # Editors
  include 'env::min::packages'
  # system
  include 'env::min::udev'
  # ssh
  include 'env::min::ssh'
  # setup
  include 'env::min::locales'
  # motd
  include 'env::min::motd'
  # tgs-g5k
  include 'env::min::tgz-g5k'
  # network configuration
  include 'env::min::network'
  # misc (root password, localtime, default shell...)
  include 'env::min::misc'
  # kernel installation
  include 'env::min::kernel'

}
