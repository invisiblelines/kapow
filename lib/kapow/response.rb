module Kapow
  
  class NoCreditError < StandardError; end
  class AuthenticationError < StandardError; end
  class Error < StandardError; end
  
  class Response
    
    # Raise the appropriate error or return true
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
