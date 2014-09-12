#
# Cookbook Name:: sensu-client-plugin
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

remote_directory "/etc/sensu/plugins/" do
  source "plugins"
  files_mode 0755
  mode 0755
  owner "root"
end

gems = ["redis"]

gems.each do |gem|
  execute "/opt/sensu/embedded/bin/gem install #{gem}" do
    command "/opt/sensu/embedded/bin/gem install #{gem}"
    cwd "/tmp/"
    not_if "/opt/sensu/embedded/bin/gem list | grep -w \"^#{gem}\s\""
  end
end
