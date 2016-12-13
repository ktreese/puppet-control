class profile::dnsmasq {
  include dnsmasq

  # Add hosts that cannot have puppet agent
  host { 'ts140.3031.net':
    ensure       => present,
    host_aliases => ['ts140'],
    ip           => '192.168.1.2',
    notify       => Service['dnsmasq'],
    require      => Package['dnsmasq'],
  }

  host { 'qnreese01.3031.net':
    ensure       => present,
    host_aliases => ['qnreese01'],
    ip           => '192.168.1.5',
    notify       => Service['dnsmasq'],
    require      => Package['dnsmasq'],
  }
}
