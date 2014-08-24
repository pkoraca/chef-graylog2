#
# Cookbook Name:: graylog2
# Recipe:: default
#

include_recipe 'java'
include_recipe "graylog2::mongo"
include_recipe "graylog2::elasticsearch"

%w{/etc/graylog2 /var/log/graylog2 /var/run/graylog2}.each do |dir|
  directory dir do
	    owner "root"
	    group "root"
	    mode "0755"
	    recursive true
	    action :create
	end
end

include_recipe "graylog2::server"
include_recipe "graylog2::web-interface"



