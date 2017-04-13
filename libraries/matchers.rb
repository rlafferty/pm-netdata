if defined?(ChefSpec)
  ChefSpec.define_matcher :netdata

  def install_netdata(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:netdata, :install, resource_name)
  end

  def uninstall_netdata(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:netdata, :uninstall, resource_name)
  end
end
