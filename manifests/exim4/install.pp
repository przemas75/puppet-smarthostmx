################################################################################
#
# Class to install exim4
#
################################################################################
class smarthost::exim4::install {

    $paths      = $smarthost::params::paths
    $packages   = $smarthost::exim4::packages
    $services   = $smarthost::exim4::services
    $smarthost  = $smarthost::params::smarthost

    package { $packages :
        ensure  => present,
    }

}

