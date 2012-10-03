# == Define: apt::function::preseed
#
# === Parameters
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
define apt::function::preseed(
  $content
) {
  require apt::client

  file { "/var/local/preseed/${name}":
    ensure  => present,
    content => $content,
    group   => root,
    mode    => '0400',
    owner   => root,
    require => File['/var/local/preseed'],
  }
}

# vim:sw=2:ts=2:expandtab:textwidth=79
