#!/usr/bin/env ruby

require "bundler/setup"
require "proxy_list"

manager = ProxyList::Manager.new
manager.fetch
manager.validate
puts manager.proxy
