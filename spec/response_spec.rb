require File.dirname(__FILE__) + '/spec_helper'
require File.dirname(__FILE__) + '/../lib/kapow'

module Kapow
  
  describe "Message Response" do
    
    before do
      @response = Net::HTTPSuccess.new('1.1', '200', 'OK')
    end
    
    it "should raise Kapow::Authentication error if response is USERPASS" do
      @response.stub!(:body).and_return("USERPASS")
      lambda { Response.parse(@response) }.should raise_error(Kapow::AuthenticationError)
    end
    
    it "should raise Kapow::NoCreditError error if response is NOCREDIT" do
      @response.stub!(:body).and_return("NOCREDIT")
      lambda { Response.parse(@response) }.should raise_error(Kapow::NoCreditError)
    end
    
    it "should raise Kapow::Error error if response is ERROR" do
      @response.stub!(:body).and_return("ERROR")
      lambda { Response.parse(@response) }.should raise_error(Kapow::Error)
    end
    
    it "should return true if response is OK" do
      @response.stub!(:body).and_return("OK CREDITS")
      lambda { Response.parse(@response) }.should_not raise_error
    end
    
    it "should return the amount of credit available if response is OK" do
      @response.stub!(:body).and_return("OK 111")
      Response.parse(@response)
      Kapow::Credit.to_s.should == "111"
    end
    
  end
  
end