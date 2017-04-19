# Class: packages
# ===========================
#
# Full description of class packages here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'packages':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2017 Your name here, unless otherwise noted.
#
class packages (
  Hash    $packages,
  Hash    $package_defaults,
  Boolean $purge_packages,
  Boolean $signal_purge_only,
) {

  resources { 'package':
    purge => $purge_packages,
    noop  => $signal_purge_only,
  }

  $packages.each | String $package_name, Hash $package_attr | {
    package { $package_name:
      * => $package_defaults + $package_attr,
    }
  }

}
