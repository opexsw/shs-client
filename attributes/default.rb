# Attributes specific to the self healing client
default['shs-client']['server_host_name'] = 'ip-172-31-33-212.ec2.internal'
default['shs-client']['shs_handler_debug'] = 'true'

# Attributes specific to log rotation on server/client
default['logrotate']['filesize'] = '1M'
default['logrotate']['num_of_file_rotation'] = '4'
default['logFiles']['remove_before_no_of_days'] = '7'

# Attributes specific to serf installation on server/client
default['serf']['serf_url'] = 'https://releases.hashicorp.com/serf/0.7.0/serf_0.7.0_linux_amd64.zip'
default['serf']['serf_zip_file'] = 'serf_0.7.0_linux_amd64.zip'
default['serf']['encrypt_key'] = 'OKo8QmHU5SoLcdVGWARt5A=='
