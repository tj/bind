
require 'rubygems'
require 'haml'
require 'haml/exec'

module Bind
  module Actions
    class RefreshBrowsersHaml
      
      attr_accessor :browsers, :uri
      
      def initialize uri, dest, *browsers
        @uri, @dest, @browsers = uri, dest, browsers
      end
      
      def call file
        build_haml file if haml? file
        build_sass file if sass? file
        @browsers.each { |browser| `open -g -a #{browser} #{uri}` } 
      end
      
      def build_haml file
        opts = Haml::Exec::Haml.new [file.path, File.join(@dest, file.path)]
        opts.parse!
      end
      
      def build_sass file
        opts = Haml::Exec::Sass.new [file.path, File.join(@dest, file.path)]
        opts.parse!
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
