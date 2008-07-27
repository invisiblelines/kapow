module Kapow

  module Credit
  
    class << self
    
      attr_accessor :available
    
      def to_s
        available.to_s
      end
  
    end
  
  end

end