module Kapow
  
  class NoCreditError < StandardError; end
  class AuthenticationError < StandardError; end
  class Error < StandardError; end
  
  # A small class for parsing the response from the sms gateway.
  class Response
    
    # Parses the response body. Raises the appropriate error or returns true.
    # Also updates the amount of available credit.
    def self.parse(response)
      case response
      when Net::HTTPSuccess, Net::HTTPRedirection
        case response.body
        when "USERPASS" : raise AuthenticationError
        when "NOCREDIT" : raise NoCreditError
        when "ERROR" : raise Error
        when /OK/
          if response.body.match(/OK (.*)/)
            Kapow::Credit.available = $1.to_i
          end
          return true
        end
      else
        response.error!
      end
    end
    
  end
  
end
