################################################################################
#
#
#
################################################################################
class smarthost (
  Optional[String] $mta       = $smarthost::params::mta,
  Optional[String] $smarthost = $smarthost::params::smarthost,
  Optional[String] $paths     = $smarthost::params::paths,
) inherits smarthost::params {

}
