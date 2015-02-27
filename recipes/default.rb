#
# Cookbook Name:: graylog2
# Recipe:: default
#

repo = "graylog-#{node[:graylog2][:version_minor]}-repository-el6_latest.rpm"

remote_file "#{Chef::Config[:file_cache_path]}/#{repo}" do
    source "https://packages.graylog2.org/repo/packages/#{repo}"
    action :create
end

package "#{repo}" do
	source "#{Chef::Config[:file_cache_path]}/#{repo}"
	action :install
end

include_recipe "graylog2::mongo"
include_recipe "graylog2::elasticsearch"
include_recipe "graylog2::server"
include_recipe "graylog2::web-interface"



