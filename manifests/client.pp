# == Class: apt::client
#
# This class manages the APT client
#
# === Examples
#
#  class { 'apt::client': }
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
class apt::client(
  $components = 'main universe',
  $mirror     = 'ca.archive.ubuntu.com',
  $protocol   = 'http://',
  $stage      = 'bootstrap',
) {
  include apt::params
  include apt::client::init
}

# vim:sw=2:ts=2:expandtab:textwidth=79
