#
# Cookbook Name:: perl-build
# Recipe:: default
#
# Copyright 2013, kenjiskywalker
#
# All rights reserved - Do Not Redistribute
#

version         = node['perl-build']['version']
install_path    = node['perl-build']['install_path']
remote_uri      = "https://raw.github.com/tokuhirom/Perl-Build/master/perl-build"

execute "perl-build install" do
  command "curl #{remote_uri} | perl - #{version} #{install_path}"
  not_if { File.exists?("#{install_path}") }
end
