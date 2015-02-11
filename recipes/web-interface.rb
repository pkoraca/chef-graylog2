include_recipe 'java'

package "graylog-web" do
  action :install
end

template "graylog-web-init" do
	path "/etc/init.d/graylog-web"
	source "graylog-web-initscript.erb"
	owner "root"
	group "root"
	mode "0755"
end

template "graylog-web.conf" do
	path "/etc/graylog/web/web.conf"
	source "graylog-web-interface.conf.erb"
	owner "root"
	group "root"
	mode "0644"
end

template "graylog-web-sysconfig" do
	path "/etc/sysconfig/graylog-web"
	source "graylog-web-sysconfig.erb"
	owner "root"
	group "root"
	mode "0755"
end

service "graylog-web" do
	supports :status => true, :restart => true
	action [ :enable, :start ]
end
