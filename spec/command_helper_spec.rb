
require 'bind/command_helpers'
require 'ostruct'

describe Bind do
  describe "Helpers" do
    
    describe "#expand_path" do
      it "should expand local files to an asolute path" do
        expand_path('History.rdoc').should include('bind/History.rdoc')
      end
      
      it "should leave uris as they are" do
        expand_path('http://foo.com').should == 'http://foo.com'
      end
    end
    
    describe "#options_to_hash" do
      it "should transform an options struct into a hash" do
        options = OpenStruct.new
        options.foo = 'bar'
        options_to_hash(options)[:foo].should == 'bar'
      end
    end
    
  end
end