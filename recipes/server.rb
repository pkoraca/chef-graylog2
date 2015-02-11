
include_recipe 'java'

package "graylog-server" do
  action :install
end

  directory "/data/journal" do
      owner "root"
      group "root"
      mode "0755"
      recursive true
      action :create
  end

template "graylog-server-init" do
  path "/etc/init.d/graylog-server"
  source "graylog-server-initscript.erb"
  owner "root"
  group "root"
  mode "0755"
  notifies :restart, "service[graylog-server]"
end

template "graylog-server.conf" do
  path "/etc/graylog/server/server.conf"
  source "graylog-server.conf.erb"
  owner "root"
  group "root"
  mode "0644"
  notifies :restart, "service[graylog-server]", :delayed
end

template "graylog-server-sysconfig" do
  path "/etc/sysconfig/graylog2-server"
  source "graylog-server-sysconfig.erb"
  owner "root"
  group "root"
  mode "0755"
  notifies :restart, "service[graylog-server]"
end
=begin 
template "log4j.xml" do
  path "/opt/graylog-server/log4j.xml"
  source "log4j.xml.erb"
  owner "root"
  group "root"
  mode "0644"
end

=end

service "graylog-server" do
  supports :status => true, :restart => true
  action [ :enable, :start ]
end