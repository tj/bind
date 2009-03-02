
module Bind
  module Actions
    class RefreshBrowser
      
      attr_reader :browsers
      
      def initialize *browsers
        @browsers = browsers
      end
      
      def call file
        @browsers.each { |browser| open browser, file } 
      end
      
      def open browser, file
        `open -ag #{browser} #{ File.expand_path(file) }`
      end
      
    end
  end
end