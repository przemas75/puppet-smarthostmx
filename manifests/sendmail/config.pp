################################################################################
#
# Class to configure sendmail
#
################################################################################
class smarthost::sendmail::config {

    $paths      = $smarthost::params::paths
    $packages   = $smarthost::sendmail::packages
    $services   = $smarthost::sendmail::services

    file { '/etc/mail/sendmail.mc' :
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
        content => template('smarthost/sendmail/sendmail.mc.erb'),
    }

    $make = $paths['make']
    exec { 'make_sendmail_mc' :
        command     => "${make} -C /etc/mail",
        cwd         => '/etc/mail',
        refreshonly => true,
        subscribe   => File['/etc/mail/sendmail.mc'],
        notify      => Service[$services],
    }

}

