class profile::base::linux::packages {

  $timekeeper = $::facts['os']['release']['major'] ? {
    '6'     => 'ntpd',
    '7'     => 'chrony',
    default => 'ntpd',
  }

  package { $timekeeper:
    ensure => present,
  }

}
