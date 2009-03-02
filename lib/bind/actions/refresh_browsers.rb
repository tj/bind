
module Bind
  module Actions
    class RefreshBrowsers
      
      attr_accessor :browsers, :uri
      
      def initialize uri, *browsers
        @uri, @browsers = uri, browsers
      end
      
      def call file
        @browsers.each { |browser| `open -g -a #{browser} #{uri}` } 
      end
      
    end
  end
end