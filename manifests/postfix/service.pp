################################################################################
#
# Class to manage postfix service
#
################################################################################
class smarthost::postfix::service {

    $paths      = $smarthost::params::paths
    $packages   = $smarthost::postfix::packages
    $services   = $smarthost::postfix::services
    $smarthost  = $smarthost::params::smarthost

    service { $services :
        ensure => 'running',
        enable => true,
    }

}

