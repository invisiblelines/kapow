require 'spec_helper'

describe Kapow::SMS do

  let(:sms) { Kapow::SMS.new("kieran", "secret") }

  describe "posting a message" do
    let(:response) { Net::HTTPSuccess.new("1.1", "200", "OK") }
    let(:uri)      { URI.parse("http://www.kapow.co.uk/scripts/sendsms.php") }

    before do
      allow(response).to receive(:body).and_return("OK")
      allow(Net::HTTP).to receive(:post_form).and_return(@response)
    end

    it "should send an sms" do
      options = {:username => "kieran", :mobile => "4401234567890", :password => "secret", :sms => "Yo!"}
      expect(Net::HTTP).to receive(:post_form).with(uri, options).and_return(response)

      sms.deliver("4401234567890", "Yo!")
    end

    describe "with flash" do
      it "should send an sms as a flash" do
        options = {:flash => true, :username => "kieran", :mobile => "4401234567890", :password => "secret", :sms => "FLASHYo!"}
        expect(Net::HTTP).to receive(:post_form).with(uri, options).and_return(response)

        sms.deliver("4401234567890", "Yo!", :flash => true)
      end
    end

    describe "with from_id" do
      it "should send an sms with a from_id" do
        options = {:from_id => "Kieran_j", :username => "kieran", :mobile => "4401234567890", :password => "secret", :sms => "Yo!"}
        expect(Net::HTTP).to receive(:post_form).with(uri, options).and_return(response)

        sms.deliver("4401234567890", "Yo!", :from_id => "Kieran_j")
      end
    end

    describe "with long_sms" do
      let(:msg) { "The quick brown fox jumps over the lazy dog. " }

      it "should send a long sms" do
        options = {:long_sms => true, :username => "kieran", :mobile => "4401234567890", :password => "secret", :sms => msg}
        expect(Net::HTTP).to receive(:post_form).with(uri, options).and_return(response)

        sms.deliver("4401234567890", msg, :long_sms => true)
      end
    end
  end

end
