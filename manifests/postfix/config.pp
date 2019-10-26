################################################################################
#
# Class to configure postfix
#
################################################################################
class smarthost::postfix::config {

    $packages   = $smarthost::postfix::packages
    $services   = $smarthost::postfix::services

    case $::operatingsystem {
        'CentOS':       { $template_main_cf = 'main.cf.RedHat.erb' }
        'CloudLinux':   { $template_main_cf = 'main.cf.RedHat.erb' }
        'RedHat':       { $template_main_cf = 'main.cf.RedHat.erb' }
        'Ubuntu':       { $template_main_cf = 'main.cf.Ubuntu.erb' }
        default:        { fail("Unsupported OS ${::operatingsystem}") }

    }

    file { '/etc/postfix/main.cf' :
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
        content => template("smarthost/postfix/${template_main_cf}"),
        notify  => Service[$services],
    }

    file { '/etc/postfix/sender_canonical' :
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
        content => template('smarthost/postfix/sender_canonical.erb'),
        notify  => Service[$services],
    }

}

