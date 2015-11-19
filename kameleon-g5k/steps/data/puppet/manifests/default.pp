# Production environement creation recipe
# All recipes are stored in 'env' module. Here called with 'default' variant parameter.

class { 'env':
  given_variant    => 'default';
}
