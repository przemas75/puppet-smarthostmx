################################################################################
#
# Variables used within this module
#
################################################################################
class smarthost::params {

    # Default MTA selection based on OS & Version
    if $::operatingsystemmajrelease {
        $osver = "${::operatingsystem}-${::operatingsystemmajrelease}"
    } else {
        $osver = "${::operatingsystem}-${::operatingsystemrelease}"
    }

    case $::operatingsystem {
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

    $paths = {
        make                => '/usr/bin/make',
        update_exim4_conf   => '/usr/sbin/update-exim4.conf',
    }

}
