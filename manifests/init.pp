################################################################################
#
#
#
################################################################################
class smarthost (
  $mta = false,
  $smarthost = false,
  $domain = $::fqdn,
) {
  if $facts['operatingsystemmajrelease'] {
      $osver = "${::operatingsystem}-${::operatingsystemmajrelease}"
  } else {
      $osver = "${::operatingsystem}-${::operatingsystemrelease}"
  }

  case $facts['operatingsystem'] {
    'Ubuntu' : {
      $smarthost = 'localhost'
    }
    'RedHat' : {
      $smarthost = 'localhost'
    }
    'CentOS' : {
      $smarthost = 'localhost'
    }
    'Debian' : {
      $smarthost = undef
    }
    default     : {
      fail("The ${module_name} module is not supported on an ${::osfamily} based system.")
    }
  }

  case $osver {
      'CentOS-5':         { $mta = 'sendmail' }
      'CentOS-6':         { $mta = 'postfix'  }
      'CentOS-7':         { $mta = 'postfix'  }
      'Debian-7':         { $mta = 'exim4'    }
      /^Debian-jessie/:   { $mta = 'exim4'    }
      'CloudLinux-5':     { $mta = 'sendmail' }
      'CloudLinux-6':     { $mta = 'postfix'  }
      'CloudLinux-7':     { $mta = 'postfix'  }
      'RedHat-5':         { $mta = 'sendmail' }
      'RedHat-6':         { $mta = 'postfix'  }
      'RedHat-7':         { $mta = 'postfix'  }
      'Ubuntu-10.04':     { $mta = 'postfix'  }
      'Ubuntu-12.04':     { $mta = 'postfix'  }
      'Ubuntu-14.04':     { $mta = 'postfix'  }
      default:            { $mta = false      }
  }
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
