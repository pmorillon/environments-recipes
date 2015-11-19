# This file contains the 'default' class used to configure the default environment to be executed in grid'5000.

class env::default ( $parent_parameters = {} ){

  if $env::target_g5k {
    $root_pwd = hiera("env::default::misc::rootpwd")
  }
  else {
    $root_pwd = '$1$qzZwnZXQ$Ak1xs7Oma6HUHw/xDJ8q91' # grid5000
  }

  $default_parameters = {
    ganglia_enable => true,
    ntp_drift_file => true,
    misc_keep_tmp  => false,
    misc_root_pwd  => $root_pwd,
    mic_enable     => true,
  }

  $parameters = merge( $default_parameters, $parent_parameters )

  # Include big class
  class {
    'env::big':
      parent_parameters => $parameters
  }
  # OAR
  class { 'env::default::oar': }
  # g5kchecks
  class { 'env::default::g5kchecks': }
  # g5kcode
  class { 'env::default::g5kcode': }
  # g5k-subnets
  class { 'env::default::g5ksubnets': }

}
