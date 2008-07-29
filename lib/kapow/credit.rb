module Kapow
  # Module to access the amount of available credit.
  module Credit
  
    class << self
    
      attr_accessor :available
      
      # Returns the available credit 
      def to_s
        available.to_s
      end
  
    end
  
  end

end