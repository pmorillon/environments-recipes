class env ($given_variant){
  ## Global variables used for this build
  # build to be run inside g5k (could become a parameter)
  $target_g5k = true

  ## Variant (min/base/nfs/prod/big/xen)
  # need to create a local variable to access it from any sub-recipe.
  $variant = $given_variant
  $version = "0.1.0"

  ## Define a stage that will be runned after most of normal installation
  # As an exemple, this is used to setup apt-proxy. If setup earlier, any package installation would fail (proxy unreachable)
  stage { 'g5k_adjustment' :
    require => Stage['main'];
  }

  ## Define a few type that may de re-used in recipes
  # This is a dirty workaround induced by this bug in puppet: https://projects.puppetlabs.com/issues/15718 or https://tickets.puppetlabs.com/browse/PUP-1263
  # this is used later to automatically install a package with dpkg after a retrivial using wget. Looped on an array.
  define my_package {
    exec {
      $name:
        command => "/usr/bin/wget --no-check-certificate -q https://www.grid5000.fr/packages/debian/jessie/${name}_amd64.deb -O /tmp/${name}.deb",
        creates => "/tmp/${name}.deb";
    }
    package {
      $name:
        ensure  => installed,
        provider => dpkg,
        source   => "/tmp/${name}.deb",
        require  =>  Exec["${name}"];
    }
  }


  ## Call the actual recipe
  case $variant {
    'min' :  { include env::min }
    'base':  { include env::base }
    'nfs' :  { include env::nfs }
    'prod':  { include env::prod }
    'big' :  { include env::big }
    'xen' :  { include env::xen }
    default: { notify {"flavor $variant is not implemented":}}
  }
}
