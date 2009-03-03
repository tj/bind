
require 'rubygems'
require 'haml'
require 'haml/exec'

module Bind
  module Actions
    class RefreshBrowsersHaml
      
      attr_accessor :browsers, :uri
      
      def initialize uri, dest, *browsers
        @uri, @dest, @browsers = uri, File.expand_path(dest), browsers
      end
      
      def call file
        build_haml file if haml? file
        build_sass file if sass? file
        @browsers.each { |browser| `open -g -a #{browser} #{uri}` } 
      end
      
      def build_haml file
        `haml #{ file.path } #{ File.join(@dest, file.path.sub('.haml', '.html')) }`
      end
      
      def build_sass file
        `sass #{ file.path } #{ File.join(@dest, file.path.sub('.sass', '.css')) }`
      end
      
      def haml? file
        file.path.include? '.haml'
      end
      
      def sass? file
        file.path.include? '.sass'
      end
      
    end
  end
end
