################################################################################
#
# Class to install sendmail
#
################################################################################
class smarthost::sendmail::install {

    $packages   = $smarthost::sendmail::packages
    $services   = $smarthost::sendmail::services

    package { $packages :
        ensure  => present,
    }

}

