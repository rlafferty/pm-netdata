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
    supports :status => true
    action [ :enable, :start ]
  end
end

action_class do

end
