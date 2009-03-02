
require File.dirname(__FILE__) + '/../lib/bind'

action = lambda do |file|
  p file
end
listener = Bind::Listener.new :event => :change, :files => [File.dirname(__FILE__) + '/style.css'], :interval => 1, :action => action, :timeout => 10, :log => $stdout
listener.run!