class env::std::net_access {

  package {
    "rsyslog":
      ensure    => installed;
  }

  file {
    "/etc/rsyslog.conf":
      mode    => '0600',
      owner   => root,
      group   => root,
      source  => "puppet:///modules/env/std/net_access/rsyslog.conf";
    # iptables installed by kameleon. We then consider /etc/iptables already exists and iptables is installed.
    "/etc/iptables/rules.v4":
      mode    => '0600',
      owner   => root,
      group   => root,
      source  => "puppet:///modules/env/std/net_access/rules.v4"
  }
}

