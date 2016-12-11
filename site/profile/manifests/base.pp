class profile::base {
# Include a platform-appropriate base profile
  case $::kernel {
    'Linux':   { include profile::base::linux   }
    'windows': { include profile::base::windows }
  }
}
