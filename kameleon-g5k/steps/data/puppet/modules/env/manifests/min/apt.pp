class env::min::apt {

  # Keyring
  #
  include 'env::min::apt::keyring'

  # Proxy
  #
  if $env::target_g5k {
    class { 'env::min::apt::proxy':
      stage  => 'g5k_adjustment';
    }
  }

}

