# # encoding: utf-8

# Inspec test for resource uninstall_netdata_nginx in pm-netdata

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/
describe service('netdata') do
  it { should_not be_installed }
  it { should_not be_enabled }
  it { should_not be_running }
end

describe port('19999') do
  it { should_not be_listening }
end

describe user('netdata') do
  it { should_not exist }
end

describe group('netdata') do
  it { should_not exist }
end

describe etc_group.where(name: 'adm') do
  its('users') { should_not include 'netdata' }
end

describe file('/etc/nginx/sites-available/netdata') do
  it { should_not exist }
end
