# Marking images for debug purpose and to help kadeploy and pre/post-install to recognize images

class env::min::image_versioning () {

  file {
    '/etc/kaenv':
      ensure   => directory,
      mode     => '0755',
      owner    => root,
      group    => root;
    # As a reminder, this file is checked by postinstall to know if br0 must be installed or not.
    # We will then use it to store the git commit hash of git commit used to generate this image
    "/etc/kaenv/${env::variant}.dsc":
      ensure   => file,
      mode     => '0644',
      owner    => root,
      source   => 'puppet:///modules/env/min/image_versioning/git_tag',
      group    => root;
  }
}
