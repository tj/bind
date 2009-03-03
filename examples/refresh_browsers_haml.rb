
require File.dirname(__FILE__) + '/../lib/bind'

# Execute this file to start the listener, then alter style.css a few times

html  = File.expand_path(File.dirname(__FILE__) + '/demo.html')
style = File.dirname(__FILE__) + '/style.sass'
action = Bind::Actions::RefreshBrowsersHaml.new html, '.', 'Safari'
listener = Bind::Listener.new :event => :change, :files => [style], :interval => 2, :action => action, :debug => $stdout
listener.run!