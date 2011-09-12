#
# Cookbook Name:: apt
# Recipe:: upgrade
#

require_recipe 'apt'

cookbook_file "/sbin/check-apt-cacher" do
  source "check-apt-cacher"
  owner "root"
  group "root"
  mode 0700
end

execute "apt-get -y upgrade" do
  command "/sbin/check-apt-cacher && apt-get -y upgrade"
end
