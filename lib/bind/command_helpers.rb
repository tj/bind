
def set_common_options c
  c.option '-i', '--interval SECONDS', Integer, 'Interval in seconds in which to listen for an event.'
  c.option '-t', '--timeout SECONDS', Integer, 'Timeout after n seconds.'
  c.option '-r', '--require LIBS', Array, 'Require ruby libraries.'
  c.option '-V', '--verbose', 'Log information to STDOUT.'
end

def listener options
  Bind::Listener.new options_to_hash(options)
end

def populate_common_options options
  options.require.each { |lib| require lib } if options.require
  options.debug = $stdout if options.verbose
end

def expand_path path
  path.include?('://') ? path : File.expand_path(path)
end

def options_to_hash options
  options.singleton_methods.inject({}) do |hash, meth| 
    hash[meth.to_sym] = options.send meth unless meth =~ /=$/
    hash
  end
end