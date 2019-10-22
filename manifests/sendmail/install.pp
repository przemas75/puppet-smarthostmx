################################################################################
#
# Class to install sendmail
#
################################################################################
class smarthost::sendmail::install {

    $paths      = $smarthost::params::paths
    $packages   = $smarthost::sendmail::packages
    $services   = $smarthost::sendmail::services

    package { $packages :
        ensure  => present,
    }

}

