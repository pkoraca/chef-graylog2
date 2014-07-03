
path = "/opt/graylog2-server-#{node[:graylog2][:version]}"

if !::File.directory?(path)
	Chef::Log.info "Directory #{path} does not exist. Unpacking Graylog2 Server"
	ark 'graylog2-server' do
    url "https://github.com/Graylog2/graylog2-server/releases/download/#{node[:graylog2][:version]}/graylog2-server-#{node[:graylog2][:version]}.tgz"
    version node[:graylog2][:version]
    prefix_root "/opt"
    path "/opt"
    home_dir "/opt/graylog2-server"
  end
end

file "/var/run/graylog2/graylog2-server.pid" do
  action :create
  owner "root"
  group "root"
  mode "0644"
end

template "graylog2-server-init" do
  path "/etc/init.d/graylog2-server"
  source "graylog2-server-initscript.erb"
  owner "root"
  group "root"
  mode "0755"
end

template "graylog2-server.conf" do
  path "/etc/graylog2/server.conf"
  source "graylog2-server.conf.erb"
  owner "root"
  group "root"
  mode "0644"
  notifies :restart, "service[graylog2-server]", :delayed
end

template "graylog2-server-sysconfig" do
  path "/etc/sysconfig/graylog2-server"
  source "graylog2-server-sysconfig.erb"
  owner "root"
  group "root"
  mode "0755"
end

template "log4j.xml" do
  path "/opt/graylog2-server/log4j.xml"
  source "log4j.xml.erb"
  owner "root"
  group "root"
  mode "0644"
end

service "graylog2-server" do
  supports :status => true, :restart => true
  action [ :enable, :start ]
end