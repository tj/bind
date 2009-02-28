
require 'rubygems'
require 'rake'
require 'echoe'
require './lib/bind.rb'

Echoe.new("bind", Bind::VERSION::STRING) do |p|
  p.author = "TJ Holowaychuk"
  p.email = "tj@vision-media.ca"
  p.summary = "bind actions to filesystem events"
  p.url = "http://github.com/visionmedia/bind"
  p.runtime_dependencies = []
end

Dir['tasks/**/*.rake'].sort.each { |lib| load lib }