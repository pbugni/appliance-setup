# Class: appliance_components::sudo
#
# This class installs and configures sudo.
#
# Requires: nothing
#
class appliance_components::sudo {
  include ::sudo

  $username = 'itech'
  $groupname = 'itech'

  group { $groupname:
    ensure => present,
  }

  user { $username:
    comment => "openelis athenticated account",
    gid     => "$groupname",
    home    => "/home/$username",
    managehome => true,
    shell   => "/bin/bash",
    require => Group[$groupname]
  }

  file { '/etc/sudoers.d/itech':
    owner => 'root',
    group => $sudo::params::config_file_group,
    mode  => '0440',
    require => Package['sudo'],
    source => 'puppet:///modules/appliance_components/itech-sudoers',
  }
}
