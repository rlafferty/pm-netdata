# netdata prerequisite attributes
default['pm-netdata']['packages'] = ['zlib1g-dev', 'uuid-dev', 'libmnl-dev',
                                     'gcc', 'make', 'git', 'autoconf',
                                     'autoconf-archive', 'autogen',
                                     'automake', 'pkg-config', 'curl']


# netdata installer attributes
default['pm-netdata']['source']['git-repo'] = 'https://github.com/firehol/netdata.git'

# netdata nginx config
default['pm-netdata']['nginx']['conf_template'] = 'web/netdata-nginx.conf.erb'
default['pm-netdata']['nginx']['conf_cookbook'] = 'pm-netdata'
default['pm-netdata']['nginx']['port'] = '8080'
