################################################################################
#
#
#
################################################################################
class smarthost (
  Optional[String] $mta       = $smarthost::params::mta,
  Optional[String] $smarthost = $smarthost::params::smarthost,
  Struct $paths               = $smarthost::paths,
  $operatingsystem            = $::operatingsystem,
) inherits smarthost::params {



  if $mta and $mta != false {
    include "::smarthost::${mta}"
  }

  $paths = {
      make                => '/usr/bin/make',
      update_exim4_conf   => '/usr/sbin/update-exim4.conf',
  }
}
