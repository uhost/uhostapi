# uhostapi-cookbook

Installs uhostserver onto a server.

## Supported Platforms

ubuntu 14.04

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['uhostappserver']['nginx']['certificate']</tt></td>
    <td>String</td>
    <td>Certificate for nginx</td>
    <td><tt>api.getuhost.org</tt></td>
  </tr>
  <tr>
    <td><tt>['uhostappserver']['senderaddress']</tt></td>
    <td>String</td>
    <td>Config senderaddress</td>
    <td><tt>api@getuhost.org</tt></td>
  </tr>
  <tr>
    <td><tt>['uhostappserver']['domainname']</tt></td>
    <td>String</td>
    <td>Config domainname</td>
    <td><tt>getuhost.org</tt></td>
  </tr>
</table>

## Usage

### uhostapi::default

Include `uhostappserver` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[uhostappserver::default]"
  ]
}
```

## Testing

Install Chef DK
https://downloads.getchef.com/chef-dk

Make sure that chef-dk is in your path

Install bundler
sudo gem install bundler

Install packages in the Gemfile
bundle

Lint
foodcritic .

Unit Test - using chefspec
rspec --color

Integration Test - using test-kitchen
kitchen converge
kitchen setup
kitchen verify

## Development

kitchen converge 

## Contributing

1. Fork the repository on Github
2. Create a named feature branch (i.e. `add-new-recipe`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request


License & Authors
-----------------
- Author:: Mark Allen (mark@markcallen.com)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
