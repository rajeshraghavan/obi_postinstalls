# == Class: obi_postinstalls
# Full description of class obi_postinstalls here.
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

# [$bu_name = "crp", $env_name = "dev", $ver_no = "11.1.1.7", $userid = "oraclebi", $wl_hostname="obi117poc3", $wl_port="7001", $wl_pwd="password"]
#

# === Authors

# Author: Raj Raghavan <rajeshr@qualcomm.com>
# Date:   July 8, 2015
#
# === Copyright
#
# This module takes 8 input parameters like BU_Name, Env_Name, Version_No, User_name, WL HOstname, WL Port, WL Username and WL Password
#

class obi_postinstalls ($bu_name = "crp", $env_name = "dev", $ver_no = "11_1_1_7", $userid = "oraclebi", $wl_hostname="obi117poc3", $wl_port="7001", $wl_pwd="password") 
{
 if $::osfamily == 'RedHat' 
 {
  contain obi_postinstalls::cloneobieescriptrepo
  contain obi_postinstalls::obi_post_install_wrapper
  include obi_postinstalls::cloneobieescriptrepo
  include obi_postinstalls::obi_post_install_wrapper
  Class['obi_postinstalls::cloneobieescriptrepo'] -> Class['obi_postinstalls::obi_post_install_wrapper'] 
}
}   

