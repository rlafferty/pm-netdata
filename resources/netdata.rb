resource_name :netdata

property :netdata_name, String, name_property: true
property :nginx_config, String, default: 'new'

default_action :install

action :install do
  include_recipe 'pm-netdata::_packages'

  git "#{Chef::Config[:file_cache_path]}/netdata" do
    repository node['pm-netdata']['source']['git-repo']
    depth 1
    action :sync
    notifies :run, 'execute[run netdata installer]', :immediately
  end

  execute 'run netdata installer' do
    cwd "#{Chef::Config[:file_cache_path]}/netdata"
    command './netdata-installer.sh --libs-are-really-here --dont-wait'
    action :nothing
  end

  service 'netdata' do
    supports status: true
    action [:enable, :start]
  end
end

action :uninstall do
  execute 'run netdata installer' do
    cwd "#{Chef::Config[:file_cache_path]}/netdata"
    command 'yes | ./netdata-uninstaller.sh --force'
    action :run
    only_if { ::File.exist?("#{Chef::Config[:file_cache_path]}/netdata/netdata-uninstaller.sh") }
  end

  user 'netdata' do
    action :remove
  end

  group 'netdata' do
    action :remove
  end

  group 'adm' do
    append true
    excluded_members ['netdata']
    action :manage
  end
end

action_class do

end
