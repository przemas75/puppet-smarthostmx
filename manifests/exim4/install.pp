################################################################################
#
# Class to install exim4
#
################################################################################
class smarthost::exim4::install {

    $paths      = $smarthost::paths
    $packages   = $smarthost::exim4::packages
    $services   = $smarthost::exim4::services
    $smarthost  = $smarthost::smarthost

    package { $packages :
        ensure  => present,
    }

}

