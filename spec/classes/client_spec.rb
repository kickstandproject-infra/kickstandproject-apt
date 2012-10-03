require 'spec_helper'

describe 'apt::client' do
  context 'on Ubuntu 12.04 (Precise)' do
    let(:facts) { { 
      :lsbdistcodename  => 'precise',
      :lsbdistrelease   => '12.04',
      :operatingsystem  => 'Ubuntu',
    } }

    let(:params) { { :stage => 'main' } }

    it do
      should contain_file('/etc/apt').with({
        'ensure'  => 'directory',
        'group'   => 'root',
        'mode'    => '0644',
        'owner'   => 'root',
      })
    end

    it do
      should contain_file('/etc/apt/apt.conf.d').with({
        'ensure'  => 'directory',
        'group'   => 'root',
        'mode'    => '0644',
        'owner'   => 'root',
      })
    end

    it do
      should contain_file('/etc/apt/sources.list.d').with({
        'ensure'  => 'directory',
        'group'   => 'root',
        'mode'    => '0644',
        'owner'   => 'root',
      })
    end

    it do
      should contain_file('/etc/apt/apt.conf').with({
        'ensure'  => 'absent',
      })
    end

    it do
      should contain_file('/etc/apt/sources.list').with({
        'ensure'  => 'file',
        'group'   => 'root',
        'mode'    => '0644',
        'owner'   => 'root',
      })
    end

    it do
      should contain_package('python-software-properties').with_ensure('present')
    end
  end
end

# vim:sw=2:ts=2:expandtab:textwidth=79
