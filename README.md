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


## License and Authors

Author:: YOUR_NAME (<YOUR_EMAIL>)
