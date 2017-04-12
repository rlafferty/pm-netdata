#
# Cookbook:: pm-netdata
# Spec:: default
#
# Copyright:: 2017, PhishMe, All Rights Reserved.

require 'spec_helper'

test_platforms = {
  'ubuntu' => {
    'versions' => ['14.04', '16.04'],
  },
}

describe 'pm-netdata::_packages' do
  test_platforms.each do |platform, config|
    config['versions'].each do |version|
      context "on #{platform} #{version}" do
        let(:chef_run) do
          ChefSpec::ServerRunner.new(
            platform: platform,
            version: version
          ).converge(described_recipe)
        end

        it 'converges successfully' do
          expect { chef_run }.to_not raise_error
        end

        %w(zlib1g-dev uuid-dev libmnl-dev gcc make git autoconf autoconf-archive autogen automake pkg-config curl).each do |package_to_install|
          it "installs package: #{package_to_install}" do
            expect(chef_run).to install_package(package_to_install)
          end
        end
      end
    end
  end
end
