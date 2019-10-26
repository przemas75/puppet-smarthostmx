################################################################################
#
# Class to configure exim4
#
################################################################################
class smarthost::exim4::config {

    $packages   = $smarthost::exim4::packages
    $services   = $smarthost::exim4::services

    file { '/etc/mailname' :
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
        content => "${smarthost::domain}\n",
        notify  => Service[$services],
    }

    file { '/etc/exim4/update-exim4.conf.conf' :
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
        content => template('smarthost/exim4/update-exim4.conf.conf.erb'),
        notify  => Service[$services],
    }

    # $update_exim4_conf = $smarthost::paths['update_exim4_conf']
    exec { 'update_exim4_conf' :
        command     => "${smarthost::paths} -o /etc/exim4/exim4.conf",
        cwd         => '/etc/exim4',
        refreshonly => true,
        subscribe   => File['/etc/exim4/update-exim4.conf.conf'],
        notify      => Service[$services],
    }

}

