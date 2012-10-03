# == Define: apt::function::repository
#
# === Parameters
#
# [*componets*]
#
# [*dist*]
#
# [*key*]
#
# [*keyserver*]
#
# [*protocol*]
#
# [*url*]
#
# === Example
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
define apt::function::repository(
  $components,
  $key,
  $url,
  $dist = $::lsbdistcodename,
  $keyserver = 'pgp.mit.edu',
  $protocol = 'http://',
) {
  require apt::client

  file { "${name}.list":
    ensure  => present,
    content => template('apt/etc/apt/sources.list.d/repo.list'),
    notify  => Exec["${name}-apt-key ${name}-${key}"],
    path    => "${apt::params::basedir}/sources.list.d/${name}.list",
    require => Class['apt::client::config'],
  }

  exec { "${name}-apt-key ${name}-${key}":
    before      => Exec['apt::client-apt-get-update'],
    command     => "apt-key adv --keyserver ${keyserver} --recv-keys ${key}",
    notify      => Exec['apt::client-apt-get-update'],
    refreshonly => true,
  }
}

# vim:sw=2:ts=2:expandtab:textwidth=79
