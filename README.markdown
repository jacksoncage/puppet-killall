killall
====


Overview
--------

The killall module installs and manages killall application.


Module Description
-------------------

The killall module allows Puppet to install killall application.

Install
-------

Run this code on your puppet node using the Puppet Module Tool:

	puppet module install jacksoncage/killall

Clone from github:

	cd /etc/puppet/modules/
	git clone git://github.com/jacksoncage/puppet-killall.git

Setup
-----

To setup killall application on a server

    class { "killall":
      autoupdate => false,
    }

Usage
------

    class { killall:
      ensure     => running,
      autoupdate => true,
    }

The `killall` class has several parameters to assist configuration of the ntp service.

**Parameters within `killall`**

####`autoupdate`

This parameter is used to determine whether the ntp package will be updated automatically or not.

####`enable` 

This parameter allows you to choose whether to automatically start ntp daemon on boot.


Limitations
------------

This module has been built and tested using Puppet 2.7, and 3.x.

The module has been tested on:

* Debian 7.0 
* CentOS 6.4.

Testing on other platforms has been light and cannot be guaranteed.