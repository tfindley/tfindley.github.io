# Ansible Troubleshooting

## Ansible with Netbox Dynamic inventory plugin

### Error when calling inventory

If you've run an `ansible`, `ansible-playbook` or `ansible-inventory` command against a dynamic inventory and have recieved an error similar to the following:

```plaintext
Permission denied: https://my.netbox.tld/api/status/. This may impair functionality of the inventory plugin.
[WARNING]: Failed to parse inventory with 'auto' plugin: 'netbox-version'

Failed to parse inventory with 'auto' plugin.

<<< caused by >>>

'netbox-version'
Origin: <inventory plugin 'auto' with source '/path/to/inventory.yml'>

[WARNING]: Failed to parse inventory with 'yaml' plugin: Plugin configuration YAML file, not YAML inventory

Failed to parse inventory with 'yaml' plugin.

<<< caused by >>>

Plugin configuration YAML file, not YAML inventory
Origin: <inventory plugin 'yaml' with source '/home/tristan/devel/ansible/inventory/inventory.yml'>

[WARNING]: Failed to parse inventory with 'ini' plugin: Failed to parse inventory: Invalid host pattern '---' supplied, '---' is normally a sign this is a YAML file.

Failed to parse inventory with 'ini' plugin.

<<< caused by >>>

Failed to parse inventory: Invalid host pattern '---' supplied, '---' is normally a sign this is a YAML file.
Origin: /home/tristan/devel/ansible/inventory/inventory.yml

[WARNING]: Unable to parse /path/to/inventory.yml as an inventory source
[WARNING]: No inventory was parsed, only implicit localhost is available
[WARNING]: provided hosts list is empty, only localhost is available. Note that the implicit localhost does not match 'all'
[WARNING]: Could not match supplied host pattern, ignoring: hostname
```

This is likely caused by missing connection information (API Token and Netbox Server address) in your inventory file. This is actually a good thing because it likely means you havent hard-coded secrets.

This also means that the secrets are likley not set as environmental variables either.

You need to set the following two variables using the `export` command.

```bash
export NETBOX_API="https://my.netbox.tld"  # The address of your netbox instance.
export NETBOX_API_KEY="abcd1234efgh5678xyz"  # the API key generated in your Netbox instance.
export NETBOX_VALID_HTTPS=true  # Optional (defaults to true)- Set to false if you're using a self-signed certificate.
```

Also ensure your Netbox environment has the following Python modules installed:

- pynetbox - `pip install pynetbox`
- pytz - `pip install pytz`

Ensure your Ansible instance has the Netbox collection installed

```bash
ansible-galaxy collection install netbox.netbox
```
