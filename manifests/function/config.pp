# == Define: apt::function::config
#
# === Parameters
#
# [*ensure*]
#
# [*content*]
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
define apt::function::config(
  $ensure,
  $content
) {
  require apt::client

  file { "${apt::params::client::configdir}/${name}":
    ensure  => $ensure,
    content => $content,
    require => File[$apt::params::client::configdir],
  }
}

# vim:sw=2:ts=2:expandtab:textwidth=79
