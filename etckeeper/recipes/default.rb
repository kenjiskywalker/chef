#
# Cookbook Name:: etckeeper
# Recipe:: default
#
# Copyright 2011, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "etckeeper"

cookbook_file "/etc/cron.daily/etckeeper" do
  owner "root"
  mode  0755
  source "cron_daily_etckeeper"
end

cookbook_file "/etc/etckeeper/etckeeper.conf" do
  owner "root"
  mode  0644
  source "etckeeper_conf"
end
