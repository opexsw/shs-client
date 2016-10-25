litc-glds-shs-client Cookbook
=============================
This Cookbook is used to setup a Self Healing Solution for an existing monitored infrastructure. 
It consists of two essential components: Self healing server & Self healing clients.

The cookbook consists of a recipe which should be used to deploy these component:
- Self healing client deployment: `shs-client`

Requirements
------------
Operating System: centos
Dependencies
The cookbook depends on the below cookbooks:
- `windows`
- `chef_handler`

Attributes
----------

#### litc-glds-shs-client::shs-client
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['shs-client']['server_host_name']</tt></td>
    <td>String</td>
    <td>Hostname of the SHS server</td>
    <td><tt>ip-172-31-33-212.ec2.internal</tt></td>
  </tr>
  <tr>
    <td><tt>['shs-client']['shs_handler_debug']</tt></td>
    <td>String</td>
    <td>Special attribute for better logging of self healing execution on client</td>
    <td><tt>true</tt></td>
  </tr>
</table>

Usage
-----

#### litc-glds-shs-client::shs-client
This recipe is used to setup the shs-client

Just include `litc-glds-shs-client::shs-client` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[litc-glds-shs-client::shs-client]"
  ]
}
```

License and Authors
-------------------
Authors: Copyright 2016, Opex Software
