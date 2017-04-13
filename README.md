# pm-netdata Cookbook

The pm-netdata Cookbook is a library cookbook exposing a simple custom resource to install and uninstall netdata.

## Scope

This cookbook exposes resources to install and uninstall netdata, as well as integrate a new nginx vhost to expose netdata on a given port through nginx.

## Requirements

- Chef 12.5 or higher
- Network accessible package repositories

## Platform Support

The following platforms have been tested with Test Kitchen:

```
|----------------+-----+-----+
|                | 0.1 | 1.0 |
|----------------+-----+-----+
| ubuntu-14.04   | X   | X   |
|----------------+-----+-----+
| ubuntu-16.04   | X   | X   |
|----------------+-----+-----+
```

## Cookbook Dependencies

-[chef_nginx](https://supermarket.chef.io/cookbooks/chef_nginx)

## Usage

Place a dependency on the pm-netdata cookbook in your cookbook's metadata.rb (and Berksfile if leveraging berks)

```ruby
depends 'pm-netdata', '~> 1.0.0', git: 'https://github.com/rlafferty/pm-netdata.git'
```

## Attributes

- `['pm-netdata']['source']['git-repo']` - git repo with the netdata source code.
- `'pm-netdata']['nginx']['port']` - what port to configure the nginx vhost to listen on (default: 8080).

## Resources Overview

### netdata

Used to install or uninstall netdata application.

### Actions

- `install` - Install/enable netdata application
- `uninstall` - Uninstall/remove netdata application.

### Properties:

- `name` - (optional) Name of the netdata install. By default it's assumed that the name of the netdata resource is the site name, but this allows overriding that.
- `nginx_conf` - (optional) true or false to install nginx vhost (default: false).

## Frequently Asked Questions


## License

```text
Copyright:: 2009-2017

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
