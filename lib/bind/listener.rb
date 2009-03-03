

module Bind
  class Listener
    
   attr_accessor :files, :action, :timeout, :interval, :event
   attr_reader :run_time, :start_time, :finish_time
  
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
   #   :debug           log verbose debugging information to this stream
   #   :interval        sleep interval in seconds. Defaults to 2
   #
    
   def initialize options = {}
     @run_time, @mtimes = 0, {}
     @files = options.fetch :files do
      raise ArgumentError, 'specify one or more :files (or directories) to bind the listener to'
     end
     @action = options.fetch :action do
       raise ArgumentError, 'pass a valid :action responding to #call'
     end
     @log = options.fetch :debug, false
     @timeout = options.fetch :timeout, 0
     @interval = options.fetch :interval, 2
     @event = options.fetch :event, :change
   end
   
   ##
   # Start the listener.
   
   def run!
     start_time = Time.now
     log "binding to #{files.join(', ')}, watching #{event} every #{interval} second(s)." + 
         (timeout > 0 ? " Terminating in #{timeout} seconds" : '')
     catch :halt do
       loop do
         @run_time = Time.now - start_time
         throw :halt if timeout > 0 and @run_time >= timeout
         log '.', true
         files.each { |file| send event, File.new(file) } 
         sleep interval
       end
     end
     finish_time = Time.now
     log "binding terminated"
   end
   
   private
   
   ##
   # Handle change event.
   
   def change file
     if changed? file
       log "changed #{file.path}"
       action.call file
       @mtimes[file.path] = file.mtime
     end
   end
   
   ##
   # Check if +file+ has been modified since the last check.
   
   def changed? file
     file.mtime > (@mtimes[file.path] ||= file.mtime)
   end
   
   ##
   # Optionally log a +message+ when a stream has been specified.
   
   def log message, print = false
     if @log
       print ? @log.print(message) : @log.puts(message)
       @log.flush
     end 
   end
   
  end
end
