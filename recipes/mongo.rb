include_recipe "mongodb::default"

template "/lib/tmpfiles.d/mongodb.conf" do
  path "/lib/tmpfiles.d/mongodb.conf"
  source "tmpfiles_mongodb_conf.erb"
  owner "root"
  group "root"
  mode "0644"
  only_if { platform_family?('rhel') && node['platform_version'].to_i >= 7 }
end
