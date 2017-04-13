#
# Cookbook:: pm-postgresql
# Spec:: create_database
#
# Copyright:: 2017, PhishMe, All Rights Reserved.

require 'spec_helper'
require './libraries/matchers'

test_platforms = {
  'ubuntu' => {
    'versions' => ['14.04', '16.04']
  }
}

describe 'test::install_netdata' do
  test_platforms.each do |platform, config|
    config['versions'].each do |version|
      context "running on: #{platform} #{version}" do
        let(:file_cache_path) { Chef::Config[:file_cache_path] }
        let(:chef_run) do
          ChefSpec::ServerRunner.new(
            platform: platform,
            version: version,
            step_into: ['netdata']
          ).converge(described_recipe)
        end

        it 'converges successfully' do
          expect { :chef_run }.to_not raise_error
        end

        it 'includes _packages prerequisite recipe' do
          expect(chef_run).to include_recipe('pm-netdata::_packages')
        end

        it 'sync with the netdata git repo' do
          expect(chef_run).to sync_git("#{file_cache_path}/netdata")
          resource = chef_run.git("#{file_cache_path}/netdata")
          expect(resource).to notify('execute[run netdata installer]').immediately
        end

        it 'enables and starts the netdata service' do
          expect(chef_run).to start_service('netdata')
          expect(chef_run).to enable_service('netdata')
        end
      end
    end
  end
end
