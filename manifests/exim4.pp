################################################################################
#
# Class to configure exim4 MTA as smarthost relay
#
################################################################################
class smarthost::exim4 {

  $packages   = [ 'exim4' ]
  $services   = [ 'exim4' ]

  include smarthost::exim4::install
  include smarthost::exim4::config
  include smarthost::exim4::service

  Class['smarthost::exim4::install'] -> Class['smarthost::postfix::config']
  ~> Class['smarthost::exim4::service']
}
