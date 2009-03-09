
describe Bind::Listener do
  
  def listener &action
    Bind::Listener.new :event => :change, :paths => [File.dirname(__FILE__) + '/fixtures/style.css'], :interval => 1, :action => action, :timeout => 2
  end
  
  it "should record total runtime" do
    l = listener {}
    l.run!
    l.run_time.to_i.should == 2
  end
  
end