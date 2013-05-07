# Class: killall
#
#   This module install/manages the killall service.
#
#   Love Nyberg <love.nyberg@lovemusic.se>
#   2013-05-07
#
#   Tested plaforms:
#    - Debian 7.0 Wheezy
#    - CentOS 6.4
#
# Parameters:
#
#   $restrict = true
#     Whether to restrict ntp daemons from allowing others to use as a server.
#
#   $autoupdate = false
#     Whether to update the ntp package automatically or not.
#
#
# Actions:
#
#  Installs, configures, and manages the killall service.
#
# Requires:
#
# Sample Usage:
#
#   class { "killall":
#     autoupdate => false,
#   }
#
# [Remember: No empty lines between comments and class definition]
class killall($ensure='running',
          $enable=true,
          $restrict=true,
          $autoupdate=false
) {

  if ! ($ensure in [ 'running', 'stopped' ]) {
    fail('ensure parameter must be running or stopped')
  }

  if $autoupdate == true {
    $package_ensure = latest
  } elsif $autoupdate == false {
    $package_ensure = present
  } else {
    fail('autoupdate parameter must be true or false')
  }

  case $::osfamily {
    Debian: {
      $supported  = true
      $pkg_name   = [ 'psmisc' ]
      $svc_name   = 'psmisc'
    }
    RedHat: {
      $supported  = true
      $pkg_name   = [ 'killall' ]
      $svc_name   = 'killall'
    }

    Linux: {
      if ($::operatingsystem == 'Archlinux') {
        $supported = true
        $pkg_name = ['killall']
        $svc_name = 'killall'
      } else {
        fail("The ${module_name} module is not supported on an ${::operatingsystem} system")
      }
    }

    default: {
      fail("The ${module_name} module is not supported on ${::osfamily} based systems")
    }
  }

  package { 'killall':
    ensure => $package_ensure,
    name   => $pkg_name,
  }
}
