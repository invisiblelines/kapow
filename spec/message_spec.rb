require File.dirname(__FILE__) + '/spec_helper'
require File.dirname(__FILE__) + '/../lib/kapow'

module Kapow
  
  describe "Message" do
    
    before do
      @message = Message.new("kieran", "secret")
    end
  
    describe "Successfully post message" do
    
      before do
        @response = Net::HTTPSuccess.new("1.1", "200", "OK")
        @response.stub!(:body).and_return("OK")
        Net::HTTP.stub!(:post_form).and_return(@response)      
      end
    
      it "should post form to MESSAGE_URL and return success" do
        Net::HTTP.should_receive(:post_form).and_return(@response)
        @response.should_receive(:body)
        @message.deliver("+004401234567890", "Yo!")
      end
  
    end
  
    describe "Fail to post message" do
      
      before do
        @response = Net::HTTPServerError.new("1.1", "500", "Error")
        @response.stub!(:error!).and_return("UK OH")
        Net::HTTP.stub!(:post_form).and_return(@response)      
      end
    
      it "should post form to MESSAGE_URL and return error" do
        Net::HTTP.should_receive(:post_form).and_return(@response)
        @response.should_receive(:error!)
        @message.deliver("+004401234567890", "Yo!")
      end
    
    end
    
  end
  
end