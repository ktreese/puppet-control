class profile::base::linux::services {

  $timekeeper = $::facts['os']['release']['major'] ? {
    '6'     => 'ntp',
    '7'     => 'chrony',
    default => 'ntp',
  }

  service { "${timekeeper}d":
    ensure  => running,
    enable  => true,
    require => Package[$timekeeper],
  }
}
