

module Bind
  class Listener
    
   attr_reader :options, :run_time, :start_time, :finish_time
  
   #--
   # Exceptions
   #++
   
   class Error < StandardError; end
  
   ##
   # Event listener. Must specify the :files, and :action options.
   #
   # === Options:
   #
   #   :files           array of files and / or directories
   #   :action          an object responding to #call, which is used as the callback for the event handler
   #   :timeout         time in seconds, after which the listener should stop. Defaults to 0, meaning infinity
   #   :event           event to bind to, may be one of (:change). Defaults to :change
   #   :log             log verbose debugging information to this stream
   #   :interval        sleep interval in seconds. Defaults to 2
   #
    
   def initialize options = {}
     raise ArgumentError, 'specify one or more :files (or dirs) to bind actions to' unless options[:files].respond_to? :to_ary
     raise ArgumentError, "the event '#{options[:event]} is not supported" unless respond_to? options[:event]
     raise ArgumentError, 'pass a valid :action, must respodn to #call' unless options[:action].respond_to? :call
     @run_time = 0
     @options = {
       :timeout => 0,
       :interval => 2,
       :event => :change,
     }.merge options   
   end
   
   ##
   # Start the listener.
   
   def run!
     start_time = Time.now
     log 'Started listener: ' + self.inspect
     catch :timeout
       loop do
         if options[:timeout] > 0
           run_time = Time.now - start_time
           throw :timeout if run_time >= options[:timeout]
         end
         send :"on_#{options[:event]}"
         sleep options[:interval]
       end
     end
     finish_time = Time.now
   end
   
   private
   
   def on_change
    # iterate files / expand dirs
    # when modified since last time (have a hash table? )
    # then invoke the action
   end
   
   ##
   # Optionally log a +message+ when a stream has been specified.
   
   def log message
     options[:log].puts message if options.include? :log 
   end
   
  end
end

__END__
bind.
   to('style.css', 'styles').
   on('change', lambda { |file| exec 'open -a -g Safari /uri/to/refresh' }).
   wait(1.second).
   timeout_after(5.seconds).
   log_to($stdout)
action  = lambda { ... }
binding = Bind::Listener.new :event => :change, :files => ['style.css', 'styles'], :action => action, :timeout => 5.seconds, :log => $stdout, :interval => 1.second