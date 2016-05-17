require_relative './source/xroxy'
require_relative './source/cz88'

module ProxyList
    class Source
        DEFAULT_SOURCES = [Xroxy.new]
        DEFAULT_OPTIONS = {type: "http", country: "", count: 10}

        # take standardized options and customize them in their
        # respective source file.
        def list(sources=DEFAULT_SOURCES, options)
            options = DEFAULT_OPTIONS.merge!(options)
            sources.collect do |source|
                source.list(options)
            end.flatten.uniq
        end
    end
end
