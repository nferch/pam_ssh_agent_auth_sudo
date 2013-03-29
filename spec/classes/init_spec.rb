require 'spec_helper'

describe 'pam_ssh_agent_auth_sudo' do

  let(:title) { 'pam_ssh_agent_auth_sudo'}
  
  it do
    should include_class('pam_ssh_agent_auth_sudo')
  end

  it do
    should contain_file('/etc/pam.d/sudo').with({
      'ensure'  => 'present',
      'owner'   => 'root',
      'group'   => 'root',
      'mode'    => '0644',
      'source'  => 'puppet:///modules/pam_ssh_agent_auth_sudo/sudo',
      'require' => 'Package[$package]',
    })
  end

end
