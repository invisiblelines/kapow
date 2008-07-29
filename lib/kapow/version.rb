module Kapow
  
  module VERSION
    MAJOR = 0
    MINOR = 1
    TINY = 1
    
    STRING = [MAJOR, MINOR, TINY].join('.')
    
    def self.to_s
      STRING
    end
    
  end
  
end
