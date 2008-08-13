module Kapow
  
  module VERSION
    MAJOR = 0
    MINOR = 3
    TINY = 0
    
    STRING = [MAJOR, MINOR, TINY].join('.')
    
    def self.to_s
      STRING
    end
    
  end
  
end
