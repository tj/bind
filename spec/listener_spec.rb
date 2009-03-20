
describe Bind::Listener do
  
  def listener *paths, &action
    Bind::Listener.new :event => :change, :paths => paths, :interval => 1, :actions => [action], :timeout => 2
  end
  
  it "should expand directories" do
    files = %w(
      ./spec/fixtures/assets/bar.css
      ./spec/fixtures/assets/foo.css
      ./spec/fixtures/assets/jquery.js
      ./spec/fixtures/assets/js/app.js
      ./spec/fixtures/assets/js/test.js
    )
    l = listener {}
    l.expand_dirs(fixture_path('assets')).should == files
  end
  
  it "should expand directories using globbing" do
    files = %w(
      ./spec/fixtures/assets/jquery.js
      ./spec/fixtures/assets/js/app.js
      ./spec/fixtures/assets/js/test.js
    )
    l = listener {}
    l.expand_dirs(fixture_path('assets/**/*.js')).should == files
  end

  it "should record total runtime" do
    l = listener(fixture_path('style.css')) {}
    l.run!
    l.run_time.to_i.should == 2
  end
    
end