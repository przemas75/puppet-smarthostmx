################################################################################
#
# Class to configure postfix MTA as smarthost relay
#
################################################################################
class smarthost::postfix {

    $packages   = [ 'postfix' ]
    $services   = [ 'postfix' ]

    include smarthost::postfix::install
    include smarthost::postfix::config
    include smarthost::postfix::service

  Class['smarthost::postfix::install'] -> Class['smarthost::postfix::config']
  ~> Class['smarthost::postfix::service']
}
