require File.dirname(__FILE__) + '/spec_helper'
require File.dirname(__FILE__) + '/../lib/kapow'

module Kapow
  
  describe "SMS" do
    
    before do
      @sms = SMS.new("kieran", "secret")
    end
  
    describe "successfully post message" do
    
      before(:each) do
        @response = Net::HTTPSuccess.new("1.1", "200", "OK")
        @response.stub!(:body).and_return("OK")
        Net::HTTP.stub!(:post_form).and_return(@response)
        @uri = mock(URI)
        URI.stub!(:parse).and_return(@uri)
      end
    
      it "should send sms" do
        Net::HTTP.should_receive(:post_form).with(@uri, {:username => "kieran", :mobile => "4401234567890", :password => "secret", :sms => "Yo!"}).and_return(@response)
        @response.should_receive(:body)
        lambda { @sms.deliver("4401234567890", "Yo!") }.should_not raise_error
      end
      
      describe "with flash" do
      
        it "should send sms as a flash" do
          Net::HTTP.should_receive(:post_form).with(@uri, {:flash => true, :username => "kieran", :mobile => "4401234567890", :password => "secret", :sms => "FLASHYo!"}).and_return(@response)
          @response.should_receive(:body)
          lambda { @sms.deliver("4401234567890", "Yo!", :flash => true) }.should_not raise_error
        end
      
      end
      
      describe "with from_id" do
      
        it "should send sms with from_id" do
          Net::HTTP.should_receive(:post_form).with(@uri, {:from_id => "Kieran_j", :username => "kieran", :mobile => "4401234567890", :password => "secret", :sms => "Yo!"}).and_return(@response)
          @response.should_receive(:body)
          lambda { @sms.deliver("4401234567890", "Yo!", :from_id => "Kieran_j") }.should_not raise_error
        end
      
      end
      
      describe "with long_sms" do
      
        it "should send long sms" do
          msg = ""
          4.times { msg << "The quick brown fox jumps over the lazy dog. " }
          Net::HTTP.should_receive(:post_form).with(@uri, {:long_sms => true, :username => "kieran", :mobile => "4401234567890", :password => "secret", :sms => msg}).and_return(@response)
          @response.should_receive(:body)
          lambda { @sms.deliver("4401234567890", msg, :long_sms => true) }.should_not raise_error
        end
      
      end
  
    end
  
    describe "with HTTP error" do
      
      before do
        @response = Net::HTTPServerError.new("1.1", "500", "Error")
        @response.stub!(:error!).and_return("UK OH")
        Net::HTTP.stub!(:post_form).and_return(@response)      
      end
    
      it "should post form to MESSAGE_URL and return error" do
        Net::HTTP.should_receive(:post_form).and_return(@response)
        @response.should_receive(:error!)
        lambda { @sms.deliver("01234567890", "Yo!") }.should raise_error(Kapow::Error)
      end
    
    end
    
  end
  
end