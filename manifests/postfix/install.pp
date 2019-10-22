################################################################################
#
# Class to install postfix
#
################################################################################
class smarthost::postfix::install {

    $paths      = $smarthost::params::paths
    $packages   = $smarthost::postfix::packages
    $services   = $smarthost::postfix::services
    $smarthost  = $smarthost::params::smarthost

    package { $packages :
        ensure  => present,
    }

}

