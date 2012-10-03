# == Class: apt::client::config
#
# === Authors
#
# Paul Belanger <paul.belanger@polybeacon.com>
#
# === Copyright
#
# Copyright (C) 2012, PolyBeacon, Inc.
#
# This program is free software, distributed under the terms
# of the Apache License, Version 2.0. See the LICENSE file at
# the top of the source tree.
#
class apt::client::config(
  $stage = $apt::client::stage
) {
  file { $apt::params::basedir:
    ensure  => directory,
    require => Class['apt::client::install'],
  }

  file { $apt::params::configdir:
    ensure  => directory,
    require => File[$apt::params::basedir],
  }

  file { "${apt::params::basedir}/apt.conf":
    ensure  => absent,
    require => File[$apt::params::basedir],
  }

  file { "${apt::params::basedir}/sources.list.d":
    ensure  => directory,
    notify  => Exec['apt::client-apt-get-update'],
    purge   => true,
    recurse => true,
    require => File[$apt::params::basedir],
  }

  file { '/var/local/preseed':
    ensure  => directory,
    purge   => true,
    recurse => true,
  }

  file { "${apt::params::basedir}/sources.list":
    ensure  => present,
    content => template('apt/etc/apt/sources.list.erb'),
    notify  => Exec['apt::client-apt-get-update'],
    require => File[$apt::params::basedir],
  }

  apt::function::config { '10periodic':
    ensure  => present,
    content => template('apt/etc/apt/apt.conf.d/10periodic.erb'),
  }

  apt::function::config { '50unattended-upgrades':
    ensure  => present,
    content => template('apt/etc/apt/apt.conf.d/50unattended-upgrades.erb'),
  }
}

# vim:sw=2:ts=2:expandtab:textwidth=79
