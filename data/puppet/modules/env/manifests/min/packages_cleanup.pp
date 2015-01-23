class env::min::packages_cleanup {


  # Some package to remove
  $kernel_headers = "kernel-headers-$kernelrelease" # Won't be removed
  $kernel_headers_common = regsubst($kernel_headers, '$architecture', 'common')
  $removed = [
    'dpkg-dev', 'binutils', 'bzip2', 'aptitude', 'libdpkg-perl',
    'fakeroot', 'libtimedate-perl', 'manpages-dev', 'make', 'netcat',
    'netcat-traditional', 'patch', 'perl', 'perl-modules', 'libc-dev-bin',
    'linux-libc-dev', 'libc6-dev', 'libmpfr4', 'libgmp3c2', 'libgomp1',
    'libboost-iostreams1.42.0', 'libsigc++-2.0-0c2a', 'cpp', 'python',
    'inotify-tools', 'gcc-4.6-base', $kernel_headers_common,
    'linux-kbuild-3.2', 'libboost-iostreams1.49.0', 'aptitude-doc-en',
    'libclass-isa-perl', 'libquadmath0', 'python-apt-common',
    'python-minimal', 'python2.6', 'python2.6-minimal', 'python2.7',
    'python2.7-minimal', 'python3', 'python3-minimal', 'python3.2',
    'python3.2-minimal'
  ]
  # should be removed: 'libgmp10', but this remove puppet.

  package {
    $removed:
      ensure =>  purged;
  }
}
