################################################################################
#
#
#
################################################################################
class smarthost (
  $mta = undef,
  $smarthost = undef,
  $domain = $::fqdn,
) {
  include 'smarthost::params'
  $mta_real = $mta ? {
    undef   => $smarthost::params::mta,
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
    default:    { fail("Unsupported MTA ${mta_real}")   }
  }

}
