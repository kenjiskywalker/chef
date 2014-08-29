#
# Cookbook Name:: sensu-server-plugin
# Recipe:: default
#
# Copyright 2014, kenjiskywalker.
#
# All rights reserved - Do Not Redistribute
#

# GitHubからダウンロードしてくる場合
#
# plugins = ["plugin_a", "plugin_b"]
#
# plugins.each do |plugin|
#   execute 'bundle install' do
#     command "curl -OsS https://raw.githubusercontent.com/sensu/sensu-community-plugins/master/plugins/system/#{plugin}; chmod +x #{plugin}" 
#     cwd '/etc/sensu/plugins/'
#     not_if { File.exist?("/etc/sensu/plugins/#{plugin}") }
#   end
# end
#

directory "/etc/sensu/conf.d/checks/" do
  mode 0755
  action :create
  owner "root"
end

remote_directory "/etc/sensu/conf.d/checks/" do
  source "checks"
  mode 0755
  owner "root"
end

remote_directory "/etc/sensu/conf.d/metrics/" do
  source "metrics"
  mode 0755
  owner "root"
end

directory "/etc/sensu/conf.d/handlers/" do
  mode 0755
  action :create
  owner "root"
end

remote_directory "/etc/sensu/conf.d/handlers/" do
  source "handlers_config"
  files_mode 0644
  mode 0755
  owner "root"
end

remote_directory "/etc/sensu/handlers/" do
  source "handlers"
  files_mode 0755
  mode 0755
  owner "root"
end

remote_directory "/etc/sensu/plugins/" do
  source "plugins"
  files_mode 0755
  mode 0755
  owner "root"
end

service "sensu-server" do
  action [:enable, :start]
end

service "sensu-api" do
  action [:enable, :start]
end
