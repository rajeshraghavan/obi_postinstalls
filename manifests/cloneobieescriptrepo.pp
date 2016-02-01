# == Class: cloneobieescriptrepo
# Full description of class cloneobieescriptrepo here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { cloneobieescriptrepo:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <rajeshr@qualcomm.com>
# Date: June 26 2015
# === Copyright
#
# Copyright 2015 Your name here, unless otherwise noted.
#
class obi_postinstalls::cloneobieescriptrepo inherits obi_postinstalls
{

 $userid = $obi_postinstalls::userid
 if $::osfamily == 'RedHat'
 {

  file { [ "/local/mnt/workspace/", "/local/mnt/workspace/logs", "/local/mnt/workspace/OracleBI_Automated_Installs" ]:
      ensure => "directory",
      owner => "$userid",
  } ->
  vcsrepo { '/local/mnt/workspace/OracleBI_Automated_Installs':
  ensure   => present,
  provider => git,
  user => "$userid",
  source   => 'git://github.qualcomm.com/QCOMBI/OracleBI_Automated_Installs.git',
}
}
}
