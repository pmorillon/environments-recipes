class env::base::infiniband (){

  # Removed compare to older recipe : rds-tools and sdpnetstat (not present in debian repo anymore)
  $infiniband_packages = [ 'ibverbs-utils', 'libibverbs-dev', 'libcxgb3-dev', 'libipathverbs-dev', 'libmlx4-dev', 'libmthca-dev', 'librdmacm-dev', 'rdmacm-utils', 'ibutils', 'infiniband-diags', 'perftest', 'qlvnictools', 'srptools' ]
  $installed = [ $infiniband_packages, 'syslinux' ]

  package {
    $installed:
      ensure  => installed;
  }

  file {
    '/etc/infiniband/openib.conf':
      ensure   => file,
      owner    => root,
      group    => root,
      mode     => '0644',
      source   => 'puppet:///modules/env/base/infiniband/openib.conf',
      require  => Package[$infiniband_packages];
    '/etc/init.d/openibd':
      ensure   => file,
      owner    => root,
      group    => root,
      mode     => '0644',
      source   => 'puppet:///modules/env/base/infiniband/openibd',
      require  => Package[$infiniband_packages];
    '/etc/network/if-up.d/ip_over_ib':
      ensure   => file,
      owner    => root,
      group    => root,
      mode     => '0755',
      source   => 'puppet:///modules/env/base/infiniband/ip_over_ib',
      require  => Package[$infiniband_packages];

  }

  service {
    'openibd':
      enable   => false,
      require  => [
               Package[$infiniband_packages],
               File['/etc/init.d/openibd']
      ];
  }
}
