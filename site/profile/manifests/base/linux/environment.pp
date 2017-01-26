class profile::base::linux::environment {

  file { '/root/hostname.txt':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => $facts['hostname'],
  }

}
