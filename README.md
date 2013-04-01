pam_ssh_agent_auth_sudo
=======================

[![Build Status](https://travis-ci.org/tobyw4n/pam_ssh_agent_auth_sudo.png?branch=master)](https://travis-ci.org/tobyw4n/pam_ssh_agent_auth_sudo)

Puppet module that installs the pam_ssh_agent_auth PAM module and changes 
the /etc/pam.d/sudo config so that sudoers are authenticated with their 
ssh-agent instead of a password.

All you need to get your servers doing this:

    include pam_ssh_agent_auth_sudo

You may wish to check out the 
[pam_ssh_agent_auth project](http://sourceforge.net/projects/pamsshagentauth/) 
page for more information on the PAM module.

License
-------
Apache License, Version 2.0

Contact
-------
Toby Collier <tobycollier@gmail.com>

Support
-------

*   Amazon Linux provides a package for the PAM module in the default repo 
    settings.
*   RHEL and CentOS have packages in EPEL, but that repo needs to be enabled 
    separately.

Please log bugs and feature requests at the GitHub
[issues](https://github.com/tobyw4n/pam_ssh_agent_auth_sudo/issues) page.