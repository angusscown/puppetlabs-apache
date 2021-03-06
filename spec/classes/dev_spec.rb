require 'spec_helper'

describe 'apache::dev', :type => :class do
  context "on a Debian OS" do
    let :facts do
      {
        :osfamily               => 'Debian',
        :operatingsystemrelease => '6',
      }
    end
    it { should include_class("apache::params") }
    it { should contain_package("libaprutil1-dev") }
    it { should contain_package("libapr1-dev") }
    it { should contain_package("apache2-prefork-dev") }
  end
  context "on a RedHat OS" do
    let :facts do
      {
        :osfamily               => 'RedHat',
        :operatingsystemrelease => '6',
      }
    end
    it { should include_class("apache::params") }
    it { should contain_package("httpd-devel") }
  end
end
