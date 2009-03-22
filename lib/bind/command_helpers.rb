
def set_common_options c
  c.option '-i', '--interval SECONDS', Integer, 'Interval in seconds in which to listen for an event.'
  c.option '-t', '--timeout SECONDS', Integer, 'Timeout after n seconds.'
  c.option '-r', '--require LIBS', Array, 'Require ruby libraries.'
  c.option '-e', '--eval STRING', String, 'Evaluate a string of Ruby in context of Bind, so the file local variable is available.'
  c.option '-V', '--verbose', 'Log information to STDOUT.'
end

def listener options
  Bind::Listener.new options.__hash__
end

def common_options options
  options.actions ||= []
  options.actions << lambda { |file| eval options.eval } if options.eval
  options.require.each { |lib| require lib } if options.require
  options.debug = $stdout if options.verbose
end

def expand_path path
  path.include?('://') ? path : File.expand_path(path)
end