class env::min::locales {

  file {
    "/etc/locale.gen":
      mode    => 0644,
      owner   => root,
      group   => root,
      source  => "puppet:///modules/env/min/locales/locale.gen";
    "/etc/default/locale":
      mode    => 0644,
      owner   => root,
      group   => root,
      source  => "puppet:///modules/env/min/locales/locale";
  }
  package {
    'locales':
      ensure  => installed;
  }
}
