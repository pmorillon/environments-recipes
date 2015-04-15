# This file contains the 'nfs' class used to configure a basic environment with nfs support to be executed in grid'5000.

class env::nfs (){

  # Include base class
  include 'env::base'

  # Openiscsi (storage5k)
  include 'env::nfs::openiscsi'
  # Ceph
  include 'env::nfs::ceph'
  # ntp (required by nfs)
  include 'env::nfs::ntp'
  # package (shells)
  include 'env::nfs::packages'

}
