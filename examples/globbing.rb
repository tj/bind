
require File.dirname(__FILE__) + '/../lib/bind'

paths = [File.dirname(__FILE__) + '/*.rb']
action = lambda { |file| puts "modified #{file}" } 
listener = Bind::Listener.new :event => :change, :paths => paths, :interval => 1, :action => action, :timeout => 10, :debug => $stdout
listener.run!