class profile::dnsmasq {

  package { 'dnsmasq':
    ensure => present,
  }

  file { '/etc/dnsmasq.d/3031.net'
    ensure  => present,
    content => 'puppet:///modules/profile/dnsmasq/3031.net',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    notify  => Service['dnsmasq'],
    require => Package['dnsmasq'],
  }

  file { '/etc/googledns.conf'
    ensure  => present,
    content => 'puppet:///modules/profile/dnsmasq/googledns.conf',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    before  => Package['dnsmasq'],
  }

  service { 'dnsmasq':
    ensure  => running,
    enabled => true,
    require => Package['dnsmasq'],
  }

}
