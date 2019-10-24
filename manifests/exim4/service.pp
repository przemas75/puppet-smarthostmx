################################################################################
#
# Class to manage exim service
#
################################################################################
class smarthost::exim4::service {

    $paths      = $smarthost::paths
    $packages   = $smarthost::exim4::packages
    $services   = $smarthost::exim4::services
    $smarthost  = $smarthost::smarthost

    service { $services :
        ensure => 'running',
        enable => true,
    }

}

