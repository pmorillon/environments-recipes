# Marking images for debug purpose and to help kadeploy and pre/post-install to recognize images

class env::min::image_versioning () {

  file {
    '/etc/kaenv':
      ensure   => directory,
      mode     => '0755',
      owner    => root,
      group    => root;
    "/etc/kaenv/${env::variant}.dsc":
      ensure   => file,
      mode     => '0644',
      owner    => root,
      group    => root;
  }
}
