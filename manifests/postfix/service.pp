################################################################################
#
# Class to manage postfix service
#
################################################################################
class smarthost::postfix::service {

    $packages   = $smarthost::postfix::packages
    $services   = $smarthost::postfix::services

    service { $services :
        ensure => 'running',
        enable => true,
    }

}

