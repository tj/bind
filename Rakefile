
$:.unshift 'lib'
require 'bind'
require 'rubygems'
require 'rake'
require 'echoe'

Echoe.new "bind", Bind::VERSION do |p|
  p.author = "TJ Holowaychuk"
  p.email = "tj@vision-media.ca"
  p.summary = "bind actions to filesystem events"
  p.url = "http://github.com/visionmedia/bind"
  p.runtime_dependencies = []
  p.runtime_dependencies << 'commander >=4.0.0'
end

Dir['tasks/**/*.rake'].sort.each { |lib| load lib }