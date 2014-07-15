require 'spec_helper'

pkgs = ['go-server', 'go-agent']
user_dirs = ['/var/lib/go-server', '/var/run/go-server', '/var/log/go-server']
protected_dirs = ['/var/go', '/etc/go']

pkgs.each do |p|
  describe package(p) do
    it { should be_installed }
  end
end

describe port(8153) do
  it { should be_listening }
end

user_dirs.each do |ud|
 describe file(ud) do
   it { should be_directory }
   it { should be_mode 755 }
 end
end

protected_dirs.each do |pd|
  describe file(pd) do
    it { should be_directory }
    it { should be_mode 700 }
  end
end
