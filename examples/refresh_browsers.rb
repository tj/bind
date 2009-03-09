
require File.dirname(__FILE__) + '/../lib/bind'

# Execute this file to start the listener, then alter style.css a few times

actions = []
html  = File.expand_path(File.dirname(__FILE__) + '/demo.html')
style = File.dirname(__FILE__) + '/style.css'
actions << lambda { |file| puts "modified #{file.path}" }
actions << Bind::Actions::RefreshBrowsers.new(html, 'Safari')
listener = Bind::Listener.new :event => :change, :paths => [style], :interval => 1, :actions => actions, :timeout => 60
listener.run!