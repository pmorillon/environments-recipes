class env::prod::packages () {

  $editors = [ 'jed', 'joe', 'emacs' ]
  $utils = [ 'at', 'bc', 'connect-proxy', 'console-tools', 'debhelper', 'debootstrap', 'diffstat', 'discover', 'discover-data', 'ftp', 'genders', 'gnuplot', 'hdparm', 'html2text', 'hwloc', 'inotify-tools', 'info', 'iperf', 'iputils-arping', 'iputils-tracepath', 'kanif', 'lsb-release', 'mysql-client', 'nmap', 'numactl', 'pv', 'r-base', 'stress', 'open-iscsi', 'nuttcp', 'db-util', 'clustershell', 'parallel' ]

  $installed = [ $editors, $utils ]


  file {
    '/etc/parallel/config':
      ensure  => absent,
      require => Package['parallel'];
    '/etc/at.allow':
      ensure  => present,
      require => Package['at'];
    '/etc/cron.allow':
      ensure  => present,
      require => Package['cron'];
  }

  package {
    $installed:
      ensure => installed;
  }
}
