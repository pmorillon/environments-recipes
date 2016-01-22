# Grid'5000 Environments recipes

Two major tools are used to prepare environments used in Grid'5000:
- [Puppet](https://puppetlabs.com/puppet/what-is-puppet) to configure environments (install packages, configuration files, services...). See our recipes [here](https://github.com/grid5000/environments-recipes/tree/master/kameleon-g5k/steps/data/puppet/modules/env)
- [Kameleon](http://kameleon.imag.fr/) is used to create a virtual machine (VM) , call Puppet inside it and export its content in a tgz file (as used by Kadeploy) or to other formats (qcow2...).

More information can be found on Grid'5000 web site:

https://www.grid5000.fr/w/Environments_creation_using_kameleon
