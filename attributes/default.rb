default[:graylog2][:use_local_files] = false # if true, set up http server on http://localhost:80 and copy ie. graylog2-*-0.20.6.tgz
default[:graylog2][:version] = "0.92.4"
default[:graylog2][:version_minor] = "1.0"
default[:graylog2][:use_oracle_java] = false
default[:graylog2][:password_secret] = "Vf46d1Ut2YxamguLKpyv6It1MUma25oWILy8SIqrbXA3YxpUMD01sRRK4xqMP079JAGUiPM4VD9eN50xzqpyoSFdey7BR8XM"
default[:graylog2][:login_password] = "8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918"  # echo -n admin | shasum -a 256
default[:graylog2][:mongodb][:useauth] = false
default[:graylog2][:mongodb][:user] = "grayloguser"
default[:graylog2][:mongodb][:pass] = "graylogpass"
default[:graylog2][:mongodb][:host] = "127.0.0.1"
default[:graylog2][:web_interface][:server_uris] = ["http://127.0.0.1:12900/"]
default[:graylog2][:server][:java_args] = "-jar -XX:NewRatio=1 -XX:PermSize=128m -XX:MaxPermSize=256m -server -XX:+ResizeTLAB -XX:+UseConcMarkSweepGC -XX:+CMSConcurrentMTEnabled -XX:+CMSClassUnloadingEnabled -XX:+UseParNewGC -XX:-OmitStackTraceInFastThrow -Dlog4j.configuration=file:///opt/graylog2-server/log4j.xml"
default[:graylog2][:server][:java_args_oracle] = "-XX:+UnlockCommercialFeatures -XX:+FlightRecorder"
default[:graylog2][:server][:jmx_port] = 12999
default[:graylog2][:server][:xms] = 512
default[:graylog2][:server][:xmx] = 512
default[:graylog2][:server][:is_master] = true
default[:graylog2][:server][:elasticsearch_index_prefix] = "graylog2"
default[:graylog2][:server][:elasticsearch_discovery_zen_ping_unicast_hosts] = ["127.0.0.1:9300"]
default[:graylog2][:server][:elasticsearch_max_docs_per_index] = 10000000
default[:graylog2][:server][:elasticsearch_max_number_of_indices] = 4
default[:graylog2][:server][:elasticsearch_shards] = 4
default[:graylog2][:server][:elasticsearch_replicas] = 0
default[:graylog2][:server][:output_batch_size] = 25
default[:graylog2][:server][:processbuffer_processors] = 4
default[:graylog2][:server][:outputbuffer_processors] = 3
default[:graylog2][:server][:ring_size] = 1024
default[:graylog2][:server][:stream_processing_timeout] = 5000
default[:graylog2][:server][:stream_processing_max_faults] = 10
default[:graylog2][:server][:input_cache_max_size] = 5000
default[:graylog2][:server][:message_cache_spool_dir] = "/spool"
default[:graylog2][:server][:transport_email_enabled] = false
default[:graylog2][:server][:transport_email_hostname] = "mail.example.com"
default[:graylog2][:server][:transport_email_port] = 587
default[:graylog2][:server][:transport_email_use_auth] = true
default[:graylog2][:server][:transport_email_use_tls] = true
default[:graylog2][:server][:transport_email_use_ssl] = true
default[:graylog2][:server][:transport_email_auth_username] = "you@example.com"
default[:graylog2][:server][:transport_email_auth_password ] = "secret"
default[:graylog2][:server][:transport_email_subject_prefix] = "[graylog2]"
default[:graylog2][:server][:transport_email_from_email] = "graylog2@example.com"
default[:elasticsearch][:cluster][:name] = "es-graylog2"
default[:elasticsearch][:path][:conf] = "/etc/elasticsearch"
default[:elasticsearch][:path][:logs] = "/var/log/elasticsearch"
default[:elasticsearch][:allocated_memory] = "512m"
default[:elasticsearch][:version] = "1.4.2"
default[:elasticsearch][:gc_settings] =<<-CONFIG
  -XX:+UseParNewGC
  -XX:+UseConcMarkSweepGC
  -XX:CMSInitiatingOccupancyFraction=75
  -XX:+UseCMSInitiatingOccupancyOnly
CONFIG
default[:java][:jdk_version] = '7'

host_ip = node[:network][:interfaces][:eth0][:addresses].detect{|k,v| v[:family] == "inet" }.first
node.default[:graylog2][:server][:java_args] = "#{node[:graylog2][:server][:java_args]} -Djava.rmi.server.hostname=#{host_ip} -Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.port=#{node[:graylog2][:server][:jmx_port]} -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false"

if node[:graylog2][:use_oracle_java]
	node.default[:graylog2][:server][:java_args] = "#{node[:graylog2][:server][:java_args]} #{node[:graylog2][:server][:java_args_oracle]}"
	node.default[:java][:install_flavor] = 'oracle'
	node.default[:java][:jdk]['7'][:x86_64][:url] = 'http://download.oracle.com/otn-pub/java/jdk/7u4-b20/jdk-7u4-linux-x64.tar.gz'
	node.default[:java][:oracle][:accept_oracle_download_terms] = true
end
