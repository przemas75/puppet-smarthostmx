################################################################################
#
# Variables used within this module
#
################################################################################
class smarthost::params {

  # Default MTA selection based on OS & Version


  $mta = undef


  $paths = {
      make                => '/usr/bin/make',
      update_exim4_conf   => '/usr/sbin/update-exim4.conf',
  }

}
