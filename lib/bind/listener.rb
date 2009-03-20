
module Bind
  class Listener
    
   attr_accessor :paths, :actions, :timeout, :interval, :event
   attr_reader :run_time, :start_time, :finish_time
  
   #--
   # Exceptions
   #++
   
   class Error < StandardError; end
  
   ##
   # Event listener. Must specify the :paths, and :action options.
   #
   # === Options:
   #
   #   :paths           array of file or directory paths
   #   :actions         objects responding to #call, which is used as the callbacks for the event handler
   #   :timeout         time in seconds, after which the listener should stop. Defaults to 0, meaning infinity
   #   :event           event to bind to, may be one of (:change). Defaults to :change
   #   :debug           log verbose debugging information to this stream
   #   :interval        sleep interval in seconds. Defaults to 2
   #
    
   def initialize options = {}
     @run_time, @mtimes = 0, {}
     @paths = options.fetch :paths do
      raise ArgumentError, 'specify one or more :paths (or directories) to bind the listener to'
     end
     @actions = options.fetch :actions do
       raise ArgumentError, ':actions must be an array of objects responding to #call'
     end
     @log = options.fetch :debug, false
     @timeout = options.fetch :timeout, 0
     @interval = options.fetch :interval, 2
     @event = options.fetch :event, :change
   end

   ##
   # Expand directories into file paths, returns array.
   
   def expand_dirs paths
     paths.inject [] do |files, path|
       case
       when File.directory?(path) ; files += Dir["#{path}/**/*.*"]
       when File.file?(path)      ; files << path
       else                         files += Dir[path]
       end
     end    
   end
   
   ##
   # Start the listener.
   
   def run!
     files = expand_dirs @paths
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
   # Invoke all current actions with a +file+.
   
   def call_actions_with file
     actions.each { |action| action.call file } 
   end
   
   ##
   # Handle change event.
   
   def change file
     if changed? file
       log "changed #{file.path}"
       call_actions_with file
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
