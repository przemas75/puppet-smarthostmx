################################################################################
#
#
#
################################################################################
class smarthost (
  $mta       = $smarthost::params::mta,
  $osver     = $smarthost::params::osver,
  $smarthost = $smarthost::params::smarthost,
  $domain    = $::fqdn,
) inherits smarthost::params {

  if defined('$osver') {
    fail("System version set to: \$osver")
  }

  if ! $osver {
    fail("System version not set: \$osver")
  }

  case $mta {
    'exim4':    { include smarthost::exim4           }
    'sendmail': { include smarthost::sendmail        }
    'postfix':  { include smarthost::postfix         }
    default:    { fail("Unsupported MTA \$mta")      }
  }

}
