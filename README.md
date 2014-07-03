# graylog2-cookbook

Graylog2 cookbook installs [_Graylog2_](http://www.graylog2.org) centralized logging system. Current supported setup is all-in-one (Mongo, Elasticsearch, Graylog2 Server and Graylog2 Web Interface on 1 node).

## Supported Platforms

- CentOS 6

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>[:graylog2][:version]</tt></td>
    <td>String</td>
    <td>Graylog version</td>
    <td><tt>'0.20.0-rc.1'</tt></td>
  </tr>
    <tr>
    <td><tt>[:graylog2][:login_password]</tt></td>
    <td>String</td>
    <td>Admin password. Change it!</td>
    <td><tt>'admin'</tt></td>
</tr>
</table>

## Usage

### graylog2::default

Include `graylog2` in your node's `run_list`:

```
{
  "run_list": [
    "recipe[graylog2::default]"
  ]
}
```

## Contributing

1. Fork the repository on Github
2. Create a named feature branch (i.e. `add-new-recipe`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request

## License and Authors

Author: Petar Koraca (pkoraca@gmail.com)
