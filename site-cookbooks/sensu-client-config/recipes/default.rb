#
# Cookbook Name:: sensu-client-config
# Recipe:: default
#
# Copyright 2014, kenjiskywalker.
#
# All rights reserved - Do Not Redistribute
#

template "/etc/sensu/conf.d/client.json" do
  owner "root"
  mode 0644
  source "client.json.erb"
end
