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




}
