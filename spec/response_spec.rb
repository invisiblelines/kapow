require File.dirname(__FILE__) + '/spec_helper'
  
describe Kapow::Response do
  
  before do
    @response = Net::HTTPSuccess.new('1.1', '200', 'OK')
  end
  
  it "should raise Kapow::Authentication error if response is USERPASS" do
    @response.stubs(:body).returns("USERPASS")
    lambda { Kapow::Response.parse(@response) }.should raise_error(Kapow::AuthenticationError)
  end
  
  it "should raise Kapow::NoCreditError error if response is NOCREDIT" do
    @response.stubs(:body).returns("NOCREDIT")
    lambda { Kapow::Response.parse(@response) }.should raise_error(Kapow::NoCreditError)
  end
  
  it "should raise Kapow::Error error if response is ERROR" do
    @response.stubs(:body).returns("ERROR")
    lambda { Kapow::Response.parse(@response) }.should raise_error(Kapow::Error)
  end
  
  it "should return true if response is OK" do
    @response.stubs(:body).returns("OK CREDITS")
    lambda { Kapow::Response.parse(@response) }.should_not raise_error
  end
  
  it "should return the amount of credit available if response is OK" do
    @response.stubs(:body).returns("OK 111")
    Kapow::Response.parse(@response)
    Kapow::Credit.to_s.should == "111"
  end
  
  it "should raise Kapow::Error if response is not success or redirection" do
    error = Net::HTTPServerError.new("1.1", "500", "Error")
    lambda { Kapow::Response.parse(error) }.should raise_error
  end
  
end