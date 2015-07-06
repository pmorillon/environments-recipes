class env::base::misc ($root_pwd = '$1$qzZwnZXQ$Ak1xs7Oma6HUHw/xDJ8q91', $keep_tmp = true) {

  # Redefined default behaviour with keep_tmp = true
  class {
    'env::min::misc':
      keep_tmp => $keep_tmp;
      root_pwd => $root_pwd
  }
}
