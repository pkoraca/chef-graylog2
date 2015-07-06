# chef-graylog2 cookbook

Graylog cookbook installs [_Graylog_](http://www.graylog2.org) centralized logging system. Supports all-in-one and distributed deployment.

If you are looking for official Graylog cookbook you can find it [_here](https://github.com/Graylog2/graylog2-cookbook).

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
    <td><tt>'0.92.4'</tt></td>
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
