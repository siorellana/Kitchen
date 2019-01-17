#
# Cookbook:: test-prometheus-aem
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

path = node['aem']['prometheus']['base_dir']
agent = node['aem']['prometheus']['agent']
url = node['aem']['prometheus']['url']
cmd = node['aem']['prometheus']['cmd']

# We must validate that the user for this directory exists
directory path do
  action :create
  owner 'root'
  group 'root'
  mode '0644'
end

package 'java' do
    action :install
end

# Import the jar file
remote_file "#{path}/#{agent}" do
  action :create
  owner 'root'
  group 'root'
  mode '0644'
  source url
end

# Create config file
cookbook_file "#{path}/osgi_metrics_config.yml" do
  action :create
  source 'osgi_metrics_config.yml'
  notifies :run, 'execute[prometheus monitoring]', :delayed
end

execute 'prometheus monitoring' do
  action :nothing
  command cmd
  user 'root'
  group 'root'
end
