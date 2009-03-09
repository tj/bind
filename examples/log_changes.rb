
require File.dirname(__FILE__) + '/../lib/bind'

# Execute this file to start the listener, then alter any file in this directory

paths = [File.dirname(__FILE__)]
action = lambda { |file| puts "modified #{file}" } 
listener = Bind::Listener.new :event => :change, :paths => paths, :interval => 1, :actions => [action], :timeout => 10, :debug => $stdout
listener.run!