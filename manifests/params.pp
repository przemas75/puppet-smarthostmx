################################################################################
#
# Variables used within this module
#
################################################################################
class smarthost::params {


    case $facts['operatingsystem'] {
      'Ubuntu' : { $smarthost = 'localhost' $mta = 'postfix' }
      'RedHat' : { $smarthost = 'localhost' $mta = 'postfix' }
      'CentOS' : { $smarthost = 'localhost' $mta = 'postfix' }
      'Debian' : { $smarthost = undef $mta = 'exim4'         }
      default     : {
        fail("The ${module_name} module is not supported on an ${::osfamily} based system.")
      }
    }


  $paths = {
      make                => '/usr/bin/make',
      update_exim4_conf   => '/usr/sbin/update-exim4.conf',
  }

}
