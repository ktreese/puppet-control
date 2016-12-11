class profile::base::linux::packages {

  $timekeeper = $::facts['os']['release']['major'] ? {
    '6'     => 'ntp',
    '7'     => 'chrony',
    default => 'ntp',
  }

  package { $timekeeper:
    ensure => present,
  }

}
