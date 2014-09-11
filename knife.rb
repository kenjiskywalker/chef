cwd = Dir.pwd
cookbook_path   ["#{cwd}/cookbooks", "#{cwd}/site-cookbooks"]
node_path        "#{cwd}/nodes"
role_path        "#{cwd}/roles"
environment_path "#{cwd}/environments"
data_bag_path    "#{cwd}/data_bags"
encrypted_data_bag_secret "#{cwd}/data_bags/encrypted_data_bag_secret"

knife[:berkshelf_path] = "cookbooks"
file_cache_path "/tmp/chef-solo"
