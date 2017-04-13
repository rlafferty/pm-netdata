source 'https://supermarket.chef.io'

metadata

cookbook 'pm-nginx', '~> 1.0.0', git: 'https://github.com/rlafferty/pm-nginx.git'

group :integration do
  cookbook 'test', path: './test/fixtures/cookbooks/test'
end
