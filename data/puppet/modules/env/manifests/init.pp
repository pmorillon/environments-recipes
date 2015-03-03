class env ($given_variant){

  # need to create a local variable to access it from any sub-recipe.
  $variant = $given_variant
  $version = "0.1"

  case $variant {
    'min':   { include env::min }
    'base':  { include env::base }
    default: { notify {"flavor $variant is not implemented":}}
  }
}
