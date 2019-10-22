################################################################################
#
# Class to configure sendmail MTA as smarthost relay
#
################################################################################
class smarthost::sendmail {

    $packages   = [ 'sendmail', 'sendmail-cf', 'make' ]
    $services   = [ 'sendmail' ]

    include 'smarthost::sendmail::install'
    include 'smarthost::sendmail::config'
    include 'smarthost::sendmail::service'

}
