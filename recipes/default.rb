# hosts_templated:default
return unless node[:hosts][:enabled]

hosts_file = "/etc/hosts"

# OmniOS/Solaris have different locations
if platform?("omnios") do
    hosts_file = "/etc/inet/hosts"

    link "/etc/hosts"
        to "/etc/inet/hosts"
    end
end

entries_replaced = {}

# Permit macro replacement on host and ip_address
node[:hosts][:entries].each do |k,v|
    k =  k.gsub(/\{\{(.+)\}\}/) { eval "#{$1}" }
    v =  v.gsub(/\{\{(.+)\}\}/) { eval "#{$1}" }
    entries_replaced[k] = v
end

template "#{hosts_file}" do
    source "hosts.erb"
    variables(:hosts => entries_replaced)
    owner "root"
    group "sys"
    mode "0644"
end
