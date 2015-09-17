# Production environement creation recipe
# All recipes are stored in 'env' module. Here called with 'prod' variant parameter.

class { 'env':
  given_variant    => 'prod';
}
