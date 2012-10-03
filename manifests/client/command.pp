# == Class: apt::client::command
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
class apt::client::command(
  $stage = $apt::client::stage
) {
  exec { 'apt-client-apt-get-update':
    command     => 'apt-get update',
    refreshonly => true,
  }
}

# vim:sw=2:ts=2:expandtab:textwidth=79
