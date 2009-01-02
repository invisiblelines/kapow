require File.dirname(__FILE__) + '/spec_helper'
  
describe Kapow::SMS do
  
  before do
    @sms = Kapow::SMS.new("kieran", "secret")
  end

  describe "posting a message" do
  
    before do
      @response = Net::HTTPSuccess.new("1.1", "200", "OK")
      @response.stub!(:body).and_return("OK")
      Net::HTTP.stub!(:post_form).and_return(@response)
      @uri = URI.parse(Kapow::SMS::MESSAGE_URL)
    end
  
    it "should send an sms" do
      Net::HTTP.should_receive(:post_form).with(@uri, {:username => "kieran", :mobile => "4401234567890", :password => "secret", :sms => "Yo!"}).and_return(@response)
      lambda { @sms.deliver("4401234567890", "Yo!") }.should_not raise_error
    end
    
    describe "with flash" do
    
      it "should send an sms as a flash" do
        Net::HTTP.should_receive(:post_form).with(@uri, {:flash => true, :username => "kieran", :mobile => "4401234567890", :password => "secret", :sms => "FLASHYo!"}).and_return(@response)
        lambda { @sms.deliver("4401234567890", "Yo!", :flash => true) }.should_not raise_error
      end
    
    end
    
    describe "with from_id" do
    
      it "should send an sms with a from_id" do
        Net::HTTP.should_receive(:post_form).with(@uri, {:from_id => "Kieran_j", :username => "kieran", :mobile => "4401234567890", :password => "secret", :sms => "Yo!"}).and_return(@response)
        lambda { @sms.deliver("4401234567890", "Yo!", :from_id => "Kieran_j") }.should_not raise_error
      end
    
    end
    
    describe "with long_sms" do
    
      it "should send a long sms" do
        msg = ""
        4.times { msg << "The quick brown fox jumps over the lazy dog. " }
        Net::HTTP.should_receive(:post_form).with(@uri, {:long_sms => true, :username => "kieran", :mobile => "4401234567890", :password => "secret", :sms => msg}).and_return(@response)
        lambda { @sms.deliver("4401234567890", msg, :long_sms => true) }.should_not raise_error
      end
    
    end

  end
  
end