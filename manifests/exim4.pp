################################################################################
#
# Class to configure exim4 MTA as smarthost relay
#
################################################################################
class smarthost::exim4 {

  $packages   = [ 'exim4' ]
  $services   = [ 'exim4' ]


  include ::smarthost
  contain smarthost::exim4::install
  contain smarthost::exim4::config
  contain smarthost::exim4::service

  Class['smarthost::exim4::install'] -> Class['smarthost::postfix::config']
  ~> Class['smarthost::exim4::service']
}
