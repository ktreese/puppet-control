class profile::dnsmasq {

  package { 'dnsmasq':
    ensure => present,
  }

  file { '/etc/dnsmasq.d/3031.net':
    ensure  => present,
    source  => 'puppet:///modules/profile/dnsmasq/3031.net',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    notify  => Service['dnsmasq'],
    require => Package['dnsmasq'],
  }

  file { '/etc/googledns.conf':
    ensure  => present,
    source  => 'puppet:///modules/profile/dnsmasq/googledns.conf',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    before  => Package['dnsmasq'],
  }

  service { 'dnsmasq':
    ensure  => running,
    enable  => true,
    require => Package['dnsmasq'],
  }

  network::interface { $::facts['networking']['primary']:
    ipaddress => '192.168.1.3',
    netmask   => '255.255.255.0',
    gateway   => '192.168.1.1',
    bootproto => 'static',
    onboot    => 'yes',
    dns1      => '192.168.1.1',
    dns2      => '8.8.8.8',
  }

}
