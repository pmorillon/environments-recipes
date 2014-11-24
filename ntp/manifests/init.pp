# /root/kameleon_workdir/modules/ntp/init.pp

    class ntp {
      case $operatingsystem {
        centos, redhat: {
          $service_name = 'ntpd'
          $conf_file    = 'ntp.conf.el'
        }
        debian, ubuntu: {
          $service_name = 'ntp'
          $conf_file    = 'ntp.conf.debian'
        }
      }

      package { 'ntp':
        ensure => installed,
      }
      file { 'ntp.conf':
        path    => '/etc/ntp.conf',
        ensure  => file,
        require => Package['ntp'],
        source  => "puppet:///modules/ntp/ntp.conf"
      }
      service { 'ntp':
        name      => $service_name,
        ensure    => running,
        enable    => true,
        subscribe => File['ntp.conf'],
      }
    }

