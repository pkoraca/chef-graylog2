

path = "/opt/graylog2-web-interface-#{node[:graylog2][:version]}"

if !::File.directory?(path)
	Chef::Log.info "Directory #{path} does not exist. Unpacking Graylog2 Web Interface"
	ark 'graylog2-web-interface' do
	  url "https://github.com/Graylog2/graylog2-web-interface/releases/download/#{node[:graylog2][:version]}/graylog2-web-interface-#{node[:graylog2][:version]}.tgz"
	  version node[:graylog2][:version]
	  prefix_root "/opt"
	  path "/opt"
	  home_dir "/opt/graylog2-web-interface"
	end
end

# set config and init.d script
# add, enable service and start service

template "graylog2-web-init" do
	path "/etc/init.d/graylog2-web"
	source "graylog2-web-initscript.erb"
	owner "root"
	group "root"
	mode "0755"
end

template "graylog2-web.conf" do
	path "/etc/graylog2/web.conf"
	source "graylog2-web-interface.conf.erb"
	owner "root"
	group "root"
	mode "0644"
end

template "graylog2-web-sysconfig" do
	path "/etc/sysconfig/graylog2-web"
	source "graylog2-web-sysconfig.erb"
	owner "root"
	group "root"
	mode "0755"
end

service "graylog2-web" do
	supports :status => true, :restart => true
	action [ :enable, :start ]
end