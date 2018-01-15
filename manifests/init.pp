# == Class: tobyw4n/pam_ssh_agent_auth_sudo
#
# Configures sudo to use ssh-agent for authentication instead of password.
# Installs pam_ssh_agent_auth PAM module and overwrites /etc/pam.d/sudo
#
# Amazon Linux works out of the box. RHEL and CentOS require EPEL.
# === Examples
#
#  include pam_ssh_agent_auth_sudo

class pam_ssh_agent_auth_sudo {


  case $::operatingsystem {
    'amazon': {
      $supported = true
      $package = 'pam_ssh_agent_auth'
    }
    'Ubuntu': {
      $supported = true
      $package = 'pam-ssh-agent-auth'
    }
    'redhat', 'centos': {
      $supported = true
      notify { 'EPEL is required for pam_ssh_agent_auth module': }
      $package = 'pam_ssh_agent_auth'
    }
    default: {
      $supported = false
      notify { "pam_ssh_agent_auth_sudo module does not support OS ${::operatingsystem}": }
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

    file { '/etc/sudoers.d/pam_ssh_agent_auth':
      ensure => present,
      owner  => root,
      group  => root,
      mode   => '0440',
      source  => 'puppet:///modules/pam_ssh_agent_auth_sudo/pam_ssh_agent_auth',
    }
  }

}
