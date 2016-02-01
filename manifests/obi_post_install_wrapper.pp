# == Class: obi_post_install_wrapper
# Full description of class obi_post_install_wrapper here.
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
# Date:   June 26, 2015
#
# === Copyright
#
# This module leverages ERB template and takes the 7 input parameters like BU_Name, Env_Name, Version_No, User_name and Group_name
#

class obi_postinstalls::obi_post_install_wrapper inherits obi_postinstalls
{
 $Script_name = '/prj/obidev/installs/OBIEE11G/11.1.1.7/OBIEE_11.1.1.7_Linux_X86_64/silent_install.sh'
 $bu_name = $obi_postinstalls::bu_name
 $env_name = $obi_postinstalls::env_name
 $ver_no = $obi_postinstalls::ver_no
 $userid = $obi_postinstalls::userid
 $wl_hostname = $obi_postinstalls::wl_hostname
 $wl_port = $obi_postinstalls::wl_port
 $wl_pwd = $obi_postinstalls::wl_pwd

 $domain = "${bu_name}${env_name}" 
 
 if $::osfamily == 'RedHat' 
 {
     $obieeuser=hiera("$userid")
     $user_pwd=$obieeuser[1]['password']
     exec { 'OBIEE_Post_Install':
     command => "/local/mnt/workspace/OracleBI_Automated_Installs/obi_postinstall_puppet.sh ${bu_name} ${env_name} ${ver_no} ${wl_pwd} ${userid} ${user_pwd} > /local/mnt/workspace/logs/post_install.log",
     onlyif => [ 
                "test ! -f /local/mnt/obiee/$bu_name/$env_name/$ver_no/Oracle_BI1/postinstall_configs_complete"
              ],
     cwd => "/local/mnt/workspace/OracleBI_Automated_Installs",
     path => $::path,
     user => "$userid",
     logoutput => on_failure,
     }
     notify { 'Install_logs':
      message => "Executed the Post Install script /local/mnt/workspace/OracleBI_Automated_Installs/obi_postinstall_puppet.sh ${bu_name} ${env_name} ${ver_no} ${wl_pwd} ${userid} ${user_pwd}",
      }
#     include obi_post_install_wrapper
 }
}   

