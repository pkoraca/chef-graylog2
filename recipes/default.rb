#
# Cookbook Name:: graylog2
# Recipe:: default
#

include_recipe 'java'
include_recipe "graylog2::mongo"
include_recipe "graylog2::elasticsearch"

directory "/etc/graylog2" do
    owner "root" and group "root" and mode 0755
    recursive true
    action :create
end

directory "/var/log/graylog2" do
	owner "root"
	group "root"
	mode "0755"
	action :create
end

directory "/var/run/graylog2" do
	owner "root"
	group "root"
	mode "0755"
	action :create
end

include_recipe "graylog2::server"
include_recipe "graylog2::web-interface"



