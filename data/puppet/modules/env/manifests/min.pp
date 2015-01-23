# This file contains the 'min' class used to configure an environment with minimal modification to be executed in grid'5000.

class env::min ( $image_variant = 'min', $image_version = '0' ){

  # Parameter defined here are build-specific. They do not belong to hiera (not platform specific).
  # They take default value from min class. But they can be overloaded by upper scope class that include this one
  $variant=$image_variant # bit, base, nfs, prod, big
  $version=$image_version # Build version

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
  # Kexec
  include 'env::min::kexec'
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


  stage { 'cleanup': }
  Stage['main'] -> Stage['cleanup']

  #include 'env::min::packages_cleanup'
  class {
    'env::min::packages_cleanup':
      stage  => 'cleanup';
  }
}
