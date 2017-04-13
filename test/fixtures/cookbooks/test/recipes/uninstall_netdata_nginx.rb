netdata 'stuff' do
  nginx_config true
  action :install
end

netdata 'stuff' do
  nginx_config true
  action :uninstall
end
