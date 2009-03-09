
require File.dirname(__FILE__) + '/../lib/bind'

paths = [File.dirname(__FILE__) + '/*.rb']
action = lambda { |file| puts "modified #{file.path}" } 
listener = Bind::Listener.new :event => :change, :paths => paths, :interval => 1, :actions => [action], :timeout => 10
listener.run!