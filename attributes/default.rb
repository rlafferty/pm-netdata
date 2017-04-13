# netdata prerequisite attributes
default['pm-netdata']['packages'] = ['zlib1g-dev', 'uuid-dev', 'libmnl-dev',
                                     'gcc', 'make', 'git', 'autoconf',
                                     'autoconf-archive', 'autogen',
                                     'automake', 'pkg-config', 'curl']


# netdata installer attributes
default['pm-netdata']['source']['git-repo'] = 'https://github.com/firehol/netdata.git'
