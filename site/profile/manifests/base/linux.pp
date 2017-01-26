class profile::base::linux {
  include hosts
  include 'profile::base::linux::packages'
  include 'profile::base::linux::services'
  include 'profile::base::linux::environment'
}
