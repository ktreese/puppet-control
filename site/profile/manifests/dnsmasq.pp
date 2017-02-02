class profile::dnsmasq {
  include dnsmasq

  # Completely manage /etc/hosts via Puppet
  resources {'host':
    purge => true,
  } 
    
  # This means having to manage the localhost entry
  # IPv6 is disabled so no need to declare a resource for ::1
  host { 'localhost':
    ensure       => present,
    host_aliases => ['localhost.localdomain', 'localhost4', 'localhost4.localdomain4'],
    ip           => '127.0.0.1',
  }

  # Add hosts that cannot have puppet agent
  host { 'ts140.3031.net':
    ensure       => present,
    host_aliases => ['ts140'],
    ip           => '192.168.1.2',
    notify       => Service['dnsmasq'],
    require      => Package['dnsmasq'],
  }

  host { 'infoblox.3031.net':
    ensure       => present,
    host_aliases => ['infoblox'],
    ip           => '192.168.1.4',
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

  host { 'vcenter01.3031.net':
    ensure       => present,
    host_aliases => ['vcenter01'],
    ip           => '192.168.1.10',
    notify       => Service['dnsmasq'],
    require      => Package['dnsmasq'],
  }
}
