# This file contains the 'prod' class used to configure the production environment to be executed in grid'5000.

class env::prod ( $parent_parameters = {} ){

  if $env::target_g5k {
    $root_pwd = hiera("env::prod::misc::rootpwd")
  }
  else {
    $root_pwd = '$1$qzZwnZXQ$Ak1xs7Oma6HUHw/xDJ8q91' # grid5000
  }

  $prod_parameters = {
    ganglia_enable => true,
    ntp_drift_file => true,
    misc_keep_tmp  => false,
    misc_root_pwd  => $root_pwd,
    mic_enable     => true,
  }

  $parameters = merge( $prod_parameters, $parent_parameters )

  # Include nfs class
  class {
    'env::big':
      parent_parameters => $parameters
  }
  # OAR
  class { 'env::prod::oar': }
  # g5kchecks
  class { 'env::prod::g5kchecks': }
  # g5kcode
  class { 'env::prod::g5kcode': }
  # g5k-subnets
  class { 'env::prod::g5ksubnets': }

}
