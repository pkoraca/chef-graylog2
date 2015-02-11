#
# Cookbook Name:: graylog2
# Recipe:: default
#

remote_file "#{Chef::Config[:file_cache_path]}/graylog-1.0-repository-el6_latest.rpm" do
    source "https://packages.graylog2.org/repo/packages/graylog-1.0-repository-el6_latest.rpm"
    action :create
end

package "graylog-1.0-repository-el6_latest.rpm" do
	source "#{Chef::Config[:file_cache_path]}/graylog-1.0-repository-el6_latest.rpm"
	action :install
end

include_recipe "graylog2::mongo"
include_recipe "graylog2::elasticsearch"
include_recipe "graylog2::server"
include_recipe "graylog2::web-interface"



