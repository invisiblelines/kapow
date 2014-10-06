require File.dirname(__FILE__) + '/spec_helper'

describe Kapow::Response do

  let(:response) { Net::HTTPSuccess.new('1.1', '200', 'OK') }

  it "should raise Kapow::Authentication error if response is USERPASS" do
    allow(response).to receive(:body).and_return("USERPASS")

    expect {
      Kapow::Response.parse(response)
    }.to raise_error(Kapow::AuthenticationError)
  end

  it "should raise Kapow::NoCreditError error if response is NOCREDIT" do
    allow(response).to receive(:body).and_return("NOCREDIT")

    expect {
      Kapow::Response.parse(response)
    }.to raise_error(Kapow::NoCreditError)
  end

  it "should raise Kapow::Error error if response is ERROR" do
    allow(response).to receive(:body).and_return("ERROR")

    expect {
      Kapow::Response.parse(response)
    }.to raise_error(Kapow::Error)
  end

  it "should return true if response is OK" do
    allow(response).to receive(:body).and_return("OK CREDITS")

    expect {
      Kapow::Response.parse(response)
    }.not_to raise_error
  end

  it "should return the amount of credit available if response is OK" do
    allow(response).to receive(:body).and_return("OK 111")

    Kapow::Response.parse(response)
    expect(Kapow::Credit.to_s).to eq("111")
  end

  it "should raise Kapow::Error if response is not success or redirection" do
    error = Net::HTTPServerError.new("1.1", "500", "Error")

    expect {
      Kapow::Response.parse(error)
    }.to raise_error
  end

end
