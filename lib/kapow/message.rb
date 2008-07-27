%w(uri net/http).each { |lib| require lib }

module Kapow
    
  class Message
    
    MESSAGE_URL = "http://www.kapow.co.uk/scripts/sendsms.php"
    
    VALID_OPTIONS = [:from_id, :url, :lomg_sms]
    
    # The required values are: username, password, mobile & sms
    # Other optional values are: from_id & url 
    # 
    # username = Your account user name.
    # password = Your account password.

    
    def initialize(username, password, options={})
      @username = username
      @password = password
      options = options.reject { |k,v| !VALID_OPTIONS.include?(k) }
      @options = options
    end
    
    # Deliver the message
    # mobile = Recipient number, or list of comma separated numbers.
    # sms = Text for the message itself (up to 160 Characters)
    #
    # Optional parameters
    # from_id = The message originator (if enabled for your account)
    # url = URL to return to (if script is called from within a browser)
    # long_sms : boolean (if enabled in your account)
    
    def deliver(mobile, sms)
      sms_parameters = {
        :username => @username,
        :password => @password,
        :mobile => mobile,
        :sms => sms
      }.merge(@options)
      response = Response.parse(Net::HTTP.post_form(URI.parse(MESSAGE_URL), sms_parameters))
    end
    
  end
  
end