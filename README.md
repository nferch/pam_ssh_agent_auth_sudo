pam_ssh_agent_auth_sudo
=======================

Puppet module that installs the pam_ssh_agent_auth PAM module and changes the /etc/pam.d/sudo config so that sudoers are authenticated with their ssh-agent instead of a password.

All you need to get your servers doing this:

    include pam_ssh_agent_auth_sudo

You may wish to check out the [pam_ssh_agent_auth project](http://sourceforge.net/projects/pamsshagentauth/) page for more information on the PAM module.

License
-------
Apache License, Version 2.0

Contact
-------
Toby Collier <toby collier at g mail dot com>

Support
-------
This is currently only tested on Amazon Linux

Please log issues at the [pam_ssh_agent_auth_sudo GitHub issues](https://github.com/tobyw4n/pam_ssh_agent_auth_sudo/issues) page.
