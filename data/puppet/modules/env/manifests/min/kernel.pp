class env::min::kernel {

  # Install kernel
  include env::min::kernel::install

  # blacklist undesired module and regenerate initramfs
  include env::min::kernel::modules

  # initramfs regeneration declaration
  include env::min::kernel::initramfs

}
