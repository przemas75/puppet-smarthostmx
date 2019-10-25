################################################################################
#
#
#
################################################################################
class smarthost (
  Optional[String] $mta       = $smarthost::params::mta,
  Optional[String] $smarthost = $smarthost::params::smarthost,
  Optional[String] $paths     = $smarthost::params::paths,
  $osfamily                   = $::osfamily,
) inherits smarthost::params {

  contain 'smarthost::exim4'
  contain 'smarthost::postfix'
  contain 'smarthost::sendmail'

  $paths = {
      make                => '/usr/bin/make',
      update_exim4_conf   => '/usr/sbin/update-exim4.conf',
  }
}
