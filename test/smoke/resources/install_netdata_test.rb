# # encoding: utf-8

# Inspec test for resource install_netdata in pm-netdata

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/
describe service('netdata') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end

describe port('19999') do
  it { should be_listening }
end
