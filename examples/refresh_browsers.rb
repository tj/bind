
require File.dirname(__FILE__) + '/../lib/bind'

# Execute this file to start the listener, then alter style.css a few times

html  = File.expand_path(File.dirname(__FILE__) + '/demo.html')
style = File.dirname(__FILE__) + '/style.css'
action = Bind::Actions::RefreshBrowsers.new html, 'Safari', 'Firefox'
listener = Bind::Listener.new :event => :change, :paths => [style], :interval => 1, :actions => [action], :timeout => 60, :debug => $stdout
listener.run!