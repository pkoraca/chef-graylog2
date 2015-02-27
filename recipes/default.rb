#
# Cookbook Name:: graylog2
# Recipe:: default
#

include_recipe "graylog2::mongo"
include_recipe "graylog2::elasticsearch"
include_recipe "graylog2::server"
include_recipe "graylog2::web-interface"



