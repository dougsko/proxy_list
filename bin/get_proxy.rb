#!/usr/bin/env ruby

require "bundler/setup"
require "proxy_list"

manager = ProxyList::Manager.new
type = "http"
manager.fetch(type: type)
manager.validate
manager.proxies.size.times do 
    host, port = manager.proxy.split(":")
    puts "#{type} #{host} #{port}"
end
