################################################################################
#
# Class to manage sendmail service
#
################################################################################
class smarthost::sendmail::service {

    $paths      = $smarthost::params::paths
    $packages   = $smarthost::sendmail::packages
    $services   = $smarthost::sendmail::services

    service { $services :
        ensure    => 'running',
        enable    => true,
        subscribe => Exec['make_sendmail_mc'],
    }

}

