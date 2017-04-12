#
# Cookbook:: pm-netdata
# Recipe:: _packages
#
# Copyright:: 2017, PhishMe, All Rights Reserved.

node['pm-netdata']['packages'].each do |package_to_install|
  package package_to_install
end
