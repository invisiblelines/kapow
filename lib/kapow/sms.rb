module Kapow
  # A class for creating and sending an sms message using the Kapow sms gateway.
  class SMS

    VALID_OPTIONS = [:flash, :from_id, :long_sms]

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
    # <tt>:flash</tt>:: Boolean - Send SMS as a flash
    # <tt>:from_id</tt>:: The message originator (if enabled for your account)
    # <tt>:long_sms</tt>:: Boolean (if enabled in your account)

    def deliver(mobile, sms, options={})
      options = options.reject { |k,v| !VALID_OPTIONS.include?(k) }

      if options.include?(:flash) && options[:flash] == true
        sms = "FLASH#{sms}"
      end

      options.merge!({
        :username => @username,
        :password => @password,
        :mobile   => mobile,
        :sms      => sms
      })

      Response.new(Net::HTTP.post_form(message_url, options))
    end

    private

      def message_url
        URI.parse("http://www.kapow.co.uk/scripts/sendsms.php")
      end

  end

end
