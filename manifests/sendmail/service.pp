################################################################################
#
# Class to manage sendmail service
#
################################################################################
class smarthost::sendmail::service {

    $packages   = $smarthost::sendmail::packages
    $services   = $smarthost::sendmail::services

    service { $services :
        ensure    => 'running',
        enable    => true,
        subscribe => Exec['make_sendmail_mc'],
    }

}

