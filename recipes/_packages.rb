#
# Cookbook:: pm-netdata
# Recipe:: _packages
#
# Copyright:: 2017, PhishMe, All Rights Reserved.

apt_update 'update' do
  action :update
end

node['pm-netdata']['packages'].each do |package_to_install|
  package package_to_install
end
