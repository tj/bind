
describe Bind do
  
end

   bind.
      to('style.css', 'styles').
      on('change', lambda { |file| exec 'open -a -g Safari /uri/to/refresh' }).
      wait(1.second).
      timeout_after(5.seconds).
      log_to($stdout)
  end
end

action  = Bind::Action.new :proc => lambda { ... }
binding = Bind::Listener.new :event => :change, :files => ['style.css', 'styles'], :action => action, :timeout => 5.seconds, :log => $stdout, :sleep => 1.second