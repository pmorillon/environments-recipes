class env::nfs::ceph (
  $version = 'firefly'
) {

  $ceph_packages = [ 'ceph', 'ceph-fs-common', 'ceph-fuse', 'ceph-mds' ]
  # Ok, this needs an explonation. Ceph doesn't include 'jessie' repostitories. If I add wheezy rep, we have some conflict.
  # But jessie provide ceph and most of it's dep, with dependancies that are NOT the same than the one on ceph rep. So jessie version can be installed.
  # Still, to have dfs5k to works, we need 'ceph-deploy' that is NOT on jessie rep, but does only require standard packages (python).
  # We therefore (for jessie) install ceph from official repo and ceph-deploy from ceph repo (wheezy). Yes, this is dirty as hell. Let's call this "The dirty ceph patch"
  # TODO: Clean this mess: make everything be installed from ceph repo, once ceph published a jessie version of their repo.
  $ceph_packages_ceph_repository = [ 'ceph-deploy' ]
  case $operatingsystem {
    'Debian': {
      # Add ceph repositories: Won't be applied before ceph is installed. cf "The dirty ceph patch" exlonation.
      class {
        'env::nfs::ceph::apt':
          version => $version;
      }

      # Install ceph and deps
      package {
        $ceph_packages :
          ensure   => installed,
          before   => Class['env::nfs::ceph::apt']; # Cf "The dirty ceph patch" explonation
        $ceph_packages_ceph_repository :
          ensure   => installed,
          require  => [Class['env::nfs::ceph::apt'], Exec['/usr/bin/apt-get update']];
      }

      # Ensure service does not start at boot
      service {
        'ceph':
          enable  => false,
          require => Package['ceph'];
      }
    }
    default: {
      err "${operatingsystem} not suported."
    }
  }
}
