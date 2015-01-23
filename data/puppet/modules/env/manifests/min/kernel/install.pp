# In an ideal situation, we should be able to ask for a given's node (or at least cluster) image construction.
# In that case, architecture parameter should be retrieved from hiera.
# If I'm right, this construction should retrieve it at ::env::min::kernel::architecture, instead of ::<site>::<fqdn>::architecture
# TODO: try to solve this to get archi from hiera if a node is specified.

class env::min::kernel::install ($architecture = 'amd64') {

  file {
    '/etc/kernel-img.conf':
      owner   => root,
      group   => root,
      mode    => '0644',
      source  => 'puppet:///modules/env/min/kernel/kernel-img.conf'
  }

  $kernel_version = {
    wheezy   => '-2.6'
  }

  $packages = [
    "linux-image${kernel_version[$lsbrelease]}-${architecture}",
    "linux-headers${kernel_version[$lsbrelease]}-${architecture}"
  ]

  package {
    $packages:
      ensure => installed;
  }

  # Setup symlink for initrd and vmlinuz
  file {
    '/initrd.img':
      ensure    => link,
      target    => "/boot/initrd.img-${kernelrelease}";
    '/vmlinuz':
      ensure    => link,
      target    => "/boot/vmlinuz-${kernelrelease}";
  }
}
