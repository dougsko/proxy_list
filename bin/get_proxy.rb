#!/usr/bin/env ruby

require "bundler/setup"
require "proxy_list"

manager = ProxyList::Manager.new
type = "http"
manager.fetch(type: type)
manager.validate
manager.proxies.size.times do 
    proxy = manager.proxy
    host = proxy.split(":")[0]
    port = proxy.split(":")[1]
    puts "#{type} #{host} #{port}"
end
