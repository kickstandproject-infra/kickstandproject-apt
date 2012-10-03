# == Class: apt::client::init
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
class apt::client::init {
  include apt::client::install
  include apt::client::config
  include apt::client::command

  File {
    group => $apt::params::group,
    mode  => $apt::params::mode,
    owner => $apt::params::owner,
  }
}

# vim:sw=2:ts=2:expandtab:textwidth=79
