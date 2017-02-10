class profile::base::linux::environment (
  $variable = 'hello world from dev_apache feature branch',
) {

  file { '/root/hostname.txt':
    ensure  => absent,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => $facts['hostname'],
  }

  file { '/root/dev.txt':
    ensure => absent,
  }

  notify {"Message from ${::environment}.  Variable = ${variable}":}

}
