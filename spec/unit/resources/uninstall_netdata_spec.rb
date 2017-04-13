#
# Cookbook:: pm-netdata
# Spec:: install_netdata
#
# Copyright:: 2017, PhishMe, All Rights Reserved.

require 'spec_helper'
require './libraries/matchers'

test_platforms = {
  'ubuntu' => {
    'versions' => ['14.04', '16.04']
  }
}

describe 'test::uninstall_netdata' do
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

        it 'installs netdata' do
          expect(chef_run).to uninstall_netdata('stuff')
        end

        it 'removes netdata user' do
          expect(chef_run).to remove_user('netdata')
        end

        it 'removes netdata group' do
          expect(chef_run).to remove_group('netdata')
        end
      end
    end
  end
end
