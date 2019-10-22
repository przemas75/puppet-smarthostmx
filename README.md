# smarthost

## Overview

Module for configuring MTA's with a basic smarthost/relay setup.

## Module Description

This module will install an MTA and apply a basic smarthost/relay config. It
can also configure the MTA with a masquerade domain for servers without a
publicly resolvable hostname/fqdn.

## Setup

### What smarthost affects

* Installation of MTA packages. Either Exim4, Postfix or Sendmail based on OS
  defaults, or user selectable.
* Configuration files for the MTA.

### Beginning with smarthost

For a basic configuration, declare the class as follows:

```
class { '::smarthost' : }
```

## Usage

### Classes

Declare the class. There are a number of optional parameters whose defaults
are listed below:

```
class { '::smarthost' :
    smarthost   => 'mail.yourprovider.com',
    domain      => 'yourdomain.com',
    mta         => undef,
}   
```

#### Parameters wthin `smarthost`:

* `smarthost`: Required. Set to the hostname/IP address of our SMTP server.
* `domain`: Optional. Masquearade all outbound mail behind this domain. 
  Defaults to servers fully qualified domain name.
* `mta`: Optional. Use a specific MTA. Defaults to OS default MTA.

## Reference

### Public classes

* `smarthost`: The main class used to interact with this module.

### Private classes

* `smarthost::exim4`: Parent class to install and configure exim4.
* `smarthost::exim4/install`: Class to install exim4.
* `smarthost::exim4/config`: Class to configure exim4.
* `smarthost::exim4/service`: Class to manage the exim4 service.
* `smarthost::params`: Class to store default parameter values and determine OS specific values.
* `smarthost::postfix`: Parent class to install and configure postfix.
* `smarthost::postfix/install`: Class to install postfix.
* `smarthost::postfix/config`: Class to configure postfix.
* `smarthost::postfix/service`: Class to manage the postfix service.
* `smarthost::sendmail`: Parent class to install and configure sendmail.
* `smarthost::sendmail/install`: Class to install sendmail.
* `smarthost::sendmail/config`: Class to conifgure sendmail.
* `smarthost::sendmail/service`: Class to manage the sendmail service.

### Default MTA's:

* `Debian 7`: exim4
* `Debian Jessie`: exim4
* `RedHat 5`: sendmail
* `RedHat 6`: postfix
* `RedHat 7`: postfix
* `Ubuntu 10.04`: postfix
* `Ubuntu 12.04`: postfix
* `Ubuntu 14.04`: postfix

### Testing

#### Example Test

```
class { '::smarthost' :
    smarthost   => 'mail.yourprovider.com',
    domain      => 'yourdomain.com',
    mta         => 'postfix',
}   

```

`$ puppet parser validate tests/justinjl-smarthost.pp`

## Limitations

This module is for simple smarthost/relay configuration only.

This module should work on:
* CentOS: 5, 6, 7
* Debian: 7, Jessie
* RedHat: 5, 6, 7
* Ubuntu: 10.04, 12.04, 14.04

## Development

Appreciate any suggestions on feature or code changes. Let me know if you want to contribute or collaborate.

