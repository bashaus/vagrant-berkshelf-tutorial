# Part 1: Include apache dependecies
include_recipe "apache2"
include_recipe "apache2::mod_php5"
 
# Part 2: Create apache config for default vhost
template "#{node[:apache][:dir]}/sites-available/project.conf" do
  source "vhosts/project.conf.erb"
  notifies :restart, 'service[apache2]'
end
 
# Part 3: Enable site
apache_site "project.conf" do
  enable true
end