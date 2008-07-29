%w(uri net/http).each { |lib| require lib }

module Kapow
  # A class for creating and sending an sms message using the Kapow sms gateway.
  class Message
    
    MESSAGE_URL = "http://www.kapow.co.uk/scripts/sendsms.php"
    
    VALID_OPTIONS = [:from_id, :lomg_sms]
    
    # Required values are: username, password
    # <tt>:username</tt>:: Your account username.
    # <tt>:password</tt>:: Your account password.
    def initialize(username, password)
      @username = username
      @password = password
    end
    
    # Delivers the message
    # <tt>:mobile</tt>:: Recipient number, or list of comma separated numbers.
    # <tt>:sms</tt>:: Text for the message itself, truncated by gateway at 160 characters
    #
    # Optional parameters passed in as a hash
    # <tt>:from_id</tt>:: The message originator (if enabled for your account)
    # <tt>:long_sms</tt>:: Boolean (if enabled in your account)
    
    def deliver(mobile, sms, options={})
      options = options.reject { |k,v| !VALID_OPTIONS.include?(k) }
      sms_parameters = {
        :username => @username,
        :password => @password,
        :mobile => mobile,
        :sms => sms
      }.merge(options)
      response = Response.parse(Net::HTTP.post_form(URI.parse(MESSAGE_URL), sms_parameters))
    end
    
  end
  
end