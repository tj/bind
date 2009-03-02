
require File.dirname(__FILE__) + '/../lib/bind'

# Execute this file to start the listener, then alter style.css a few times

style = File.dirname(__FILE__) + '/style.css'
action = lambda { |file| puts "modified #{file}" } 
listener = Bind::Listener.new :event => :change, :files => [style], :interval => 1, :action => action, :timeout => 10, :log => $stdout
listener.run!