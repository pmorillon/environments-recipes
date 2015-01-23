class env::min::apt {

  # Keyring
  #
  include 'env::min::apt::keyring'

  # Proxy
  #
  if $target_g5k {
    include 'env::min::apt::proxy'
  }

}

