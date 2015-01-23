class env::min::kexec {

  file {
    "/etc/default/kexec":
      mode    => 0755,
      owner   => root,
      group   => root,
      source  => "puppet:///modules/env/min/kexec/kexec";
    # for sshfs
    "/usr/bin/fusermount":
      mode    => 4755;
    "/etc/udev/rules.d/40-fuse.rules":
      mode    => 0644,
      owner   => root,
      group   => root,
      source  => "puppet:///modules/env/min/kexec/40-fuse.rules";
  }

  package {
    'kexec-tools':
      ensure  => installed;
  }

}
