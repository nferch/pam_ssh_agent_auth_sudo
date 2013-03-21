# == Class: tobyw4n/pam_ssh_agent_auth_sudo
#
# Configures PAM to authenticate against ssh-agent for sudo access
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if it
#   has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should not be used in preference to class parameters  as of
#   Puppet 2.6.)
#
# === Examples
#
#  class { pam_ssh_agent_auth:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ]
#  }
#
# === Authors
#
# Toby Collier <toby collier at gmail dot com>
#
# === Copyright
#
# Copyright 2013 Toby Collier, unless otherwise noted.
#
class pam_ssh_agent_auth_sudo {

  case $operatingsystem {
    centos, redhat, amazon: {
      $supported = true
      $package = 'pam_ssh_agent_auth'
    }
    default: {
      $supported = false
      notify { "pam_ssh_agent_auth_sudo module does not support OS ${operatingsystem}": }
    }
  }

  if ($supported == true) {
    package { $package:
      ensure => 'installed',
    }

    file { '/etc/pam.d/sudo':
      ensure  => present,
      owner   => root,
      group   => root,
      mode    => '0644',
      source  => 'puppet:///modules/pam_ssh_agent_auth_sudo/sudo',
      require => Package[$package],
    }
  }

}
