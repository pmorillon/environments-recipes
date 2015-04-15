# This file contains the 'prod' class used to configure the production environment to be executed in grid'5000.

class env::prod (){

  # Include nfs class
  include 'env::nfs'

  # Users packages
  include 'env::prod::packages'
  # Activate ganglia (override default behavior)
  # TODO: should this be changed by a global parameter to avoid calling specifically a class from base?
  if $target_g5k {
    class {
      'env::base::ganglia':
        enable => true;
    }
  }

}
