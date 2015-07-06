# This file contains the 'big' class used to configure improved environment to be executed in grid'5000.

class env::big (){

  # Include prod class
  include 'env::nfs'
  # Users packages
  include 'env::big::packages'
  # gem
  if $env::target_g5k {
    class { 'env::big::gem':
      stage  => 'g5k_adjustment';
    }
  }
  # mail
  include 'env::big::mail'
  # kvm
  include 'env::big::kvm'
  # nvidia
  include 'env::big::nvidia'
  # xeon phi
  include 'env::big::mic'
}
