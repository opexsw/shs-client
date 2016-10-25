# Cookbook Name:: litc-glds-shs-client
# Recipe:: shs-client
#
# Copyright 2016, Opex Software
#
# All rights reserved - Do Not Redistribute
#

node_ip = node['ipaddress']
node_name = node['hostname']

cron_pkg_name = ''

case node['platform_family']
when 'suse'
  cron_pkg_name = 'cron'
when 'centos', 'rhel'
  cron_pkg_name = 'cronie'
end

# do Linux things
# cookbook_path = node["cookbook"]["path_linux"]
include_recipe 'shs-client::serf'

# Create a log directory
directory '/var/log/SHS' do
  action :create
end

# Install scheduler
package "#{cron_pkg_name}" do
  action :install
end

# Create serf configuration directory
bash 'Create serf directory' do
  code <<-EOH
    mkdir /usr/local/serf
  EOH
  not_if { ::File.exist?('/usr/local/serf') }
end

# Copy serf agent configuration
template '/usr/local/serf/serf_config.json' do
  source 'serf_config.json.erb'
  variables(
    node_name: node_name,
    node_name_upcase: node_name.upcase,
    node_ip: node_ip,
    shs_server_ip: node['shs-client']['server_host_name'],
    encrypt_key: node['serf']['encrypt_key'],
    debug: node['shs-client']['shs_handler_debug']
  )
end

# Copy serf handler to the machine
template '/usr/local/serf/shs_handler.sh' do
  source 'shs_handler.sh.erb'
  variables(
    shs_server_ip: node['shs-client']['server_host_name']
  )
  mode 0755
end

# create log file
execute 'Create SHS-client log file' do
  command 'touch /var/log/SHS/selfhealingscript.log'
  not_if { ::File.exist?('/var/log/SHS/selfhealingscript.log') }
end

# Install logrotate
package 'logrotate' do
  action :install
end

# LogRotate conf file
template '/var/log/SHS/clientlogrotate.conf' do
  source 'clientlogrotate.conf.erb'
  mode 0755
end

# LogRotate the SHS-client log file
execute 'LogRotate SHS-client log file' do
  command 'logrotate -s /var/log/logstatus /var/log/SHS/clientlogrotate.conf'
end

# Start agent service
service 'serf' do
  supports status: true, restart: true, reload: true
  action [:start, :enable]
end
