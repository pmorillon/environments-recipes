# This file contains the 'base' class used to configure a basic environment to be executed in grid'5000.

class env::base (){

  # Include min class
  include 'env::min'

  # User packages
  include 'env::base::packages'
  # Include kexec-tools
  include 'env::base::kexec'
  # SSh modification
  include 'env::base::ssh'
  # Sshfs
  include 'env::base::sshfs'
  # Specific tuning
  include 'env::base::tuning'
  # Cpufreq
  include 'env::base::cpufreq'
  # Ganglia
  include 'env::base::ganglia'
  #TODO: merge ib and mx as 'high perf network' (or equivalent)?
  # Infiniband
  include 'env::base::infiniband'
  # MX ?
  include 'env::base::mx'
  # Openmpi
  include 'env::base::openmpi'

}
