# == Class: apt::params
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
class apt::params {
  $basedir = $::operatingsystem ? {
    default => '/etc/apt',
  }

  $configdir = $::operatingsystem ? {
    default => '/etc/apt/apt.conf.d',
  }

  $group = $::operatingsystem ? {
    default => 'root',
  }

  $mode = $::operatingsystem ? {
    default => '0644',
  }

  $owner = $::operatingsystem ? {
    default => 'root',
  }

  $packagename = $::operatingsystem ? {
    default => 'python-software-properties',
  }
}

# vim:sw=2:ts=2:expandtab:textwidth=79
