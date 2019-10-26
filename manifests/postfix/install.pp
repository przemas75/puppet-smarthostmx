################################################################################
#
# Class to install postfix
#
################################################################################
class smarthost::postfix::install {

    $packages   = $smarthost::postfix::packages
    $services   = $smarthost::postfix::services

    package { $packages :
        ensure  => present,
    }

}

