require 'nokogiri'
require 'open-uri'

module ProxyList
    class Source
        class Xroxy
            def list(options={})
                country = options[:country]
                if options[:type] == "http"
                    type = "All_http"
                elsif options[:type] == "socks5"
                    type = "Socks5"
                else
                    type = "All_http"
                end
                if options.has_key?(:count)
                    page_count = options[:count]
                else
                    page_count = 10
                end

                proxy_servers = []
                page_count.times do |p|
                    page = open("http://www.xroxy.com/proxylist.php?pnum=#{p}&type=#{type}&country=#{country}")
                    doc  = Nokogiri::HTML(page)
                    doc.xpath("//div[@id='content']/table[1]/tr").each do |line|
                        ip    = line.xpath("./td[2]").text.strip
                        port  = line.xpath("./td[3]").text.strip
                        next unless port =~ /^\d+$/

                        proxy_servers << "#{ip}:#{port}"
                    end
                end
                return proxy_servers
            end
        end
    end
end
