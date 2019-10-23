################################################################################
#
#
#
################################################################################
class smarthost (
  $mta = false,
  $smarthost = false,
  $domain = $::fqdn,
  $osver  = $smarthost::params::osver,
) {
  include 'smarthost::params'
  $mta_real = $mta ? {
    false   => $smarthost::params::mta,
    default => $mta,
  }

  if ( $mta_real == false ) {
    $osver = $smarthost::params::osver
    fail("Unsupported OS ${osver}")
  }
  if ( $smarthost::smarthost == false ) {
    fail('No smarthost specified')
  }

  case $mta_real {
    'exim4':    { include 'smarthost::exim4'            }
    'sendmail': { include 'smarthost::sendmail'         }
    'postfix':  { include 'smarthost::postfix'          }
    default:    { fail("Unsupported MTA ${mta_real} for osver ${osver}") }
  }

}
