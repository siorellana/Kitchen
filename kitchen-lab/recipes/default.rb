#
# Cookbook:: kitchen
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.


directory '/mnt/backup/' do
    owner 'root'
    group 'root'
    mode '0755'
    action :create
  end

cookbook_file '/mnt/backup/bkp-full.sh' do
  action :create
  source 'bkp-full.sh'
  owner 'root'
  group 'root'
  mode '0600'
end

cron 'backups.sh' do
    hour '0'
    minute '15'
    day '*/3'
    command '/mnt/backup/bkp-full.sh'
    user 'root'
    #mailto node['xtra']['cron_mailto']
    action :create
  end
  