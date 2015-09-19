#
# Cookbook Name:: uhostapi
# Recipe:: nginx
#
# Copyright 2015 Mark C. Allen
#
#    Licensed under the Apache License, Version 2.0 (the "License"); you may
#    not use this file except in compliance with the License. You may obtain
#    a copy of the License at
#
#         http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
#    WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
#    License for the specific language governing permissions and limitations
#    under the License.
#

servername = Chef::Config[:node_name]

include_recipe "nginx"

sitecert = certificate_manage node['uhostappserver']['nginx']['certificate'] do
  cert_file node['uhostappserver']['nginx']['certificate'] + '.pem'
  key_file node['uhostappserver']['nginx']['certificate'] + '.key'
  nginx_cert true
  owner "www-data"
  group "www-data"
  action :create
end

sitename = "api." + servername

hosts = Array.new
hosts.push sitename

template "/etc/nginx/sites-available/"+sitename+".conf" do
  source "uhostappserver-nginx-http.erb"
  mode 0644
  owner "root"
  group "root"
  variables({
    :servername => servername,
    :host => hosts
  })
end

template "/etc/nginx/sites-available/ssl-"+sitename+".conf" do
  source "uhostappserver-nginx-https.erb"
  mode 0644
  owner "root"
  group "root"
  variables({
    :servername => servername,
    :host => hosts,
    :cert => sitecert.certificate,
    :key => sitecert.key
  })
end

link "/etc/nginx/sites-enabled/"+sitename+".conf" do
  to "/etc/nginx/sites-available/"+sitename+".conf"
end

link "/etc/nginx/sites-enabled/ssl-"+sitename+".conf" do
  to "/etc/nginx/sites-available/ssl-"+sitename+".conf"
  notifies  :restart, "service[nginx]", :immediately
end
