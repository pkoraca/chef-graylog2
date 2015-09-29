include_recipe 'java'

repo = "graylog-#{node[:graylog2][:version_minor]}-repository-el6_latest.rpm"

remote_file "#{Chef::Config[:file_cache_path]}/#{repo}" do
    source "https://packages.graylog2.org/repo/packages/#{repo}"
    action :create
end

package "#{repo}" do
	source "#{Chef::Config[:file_cache_path]}/#{repo}"
	action :install
end

package "graylog-web" do
  action :install
end

template "graylog-web.conf" do
	path "/etc/graylog/web/web.conf"
	source "graylog-web-interface.conf.erb"
  	owner node.graylog2[:user]
  	group node.graylog2[:group]
	mode "0644"
end

template "graylog-web-sysconfig" do
	path "/etc/sysconfig/graylog-web"
	source "graylog-web-sysconfig.erb"
	owner "root"
	group "root"
	mode "0644"
end

service "graylog-web" do
	supports :status => true, :restart => true
	action [ :enable, :start ]
end
