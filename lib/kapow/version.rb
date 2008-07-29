module Kapow
  
  module VERSION
    MAJOR = 0
    MINOR = 1
    TINY = 2
    
    STRING = [MAJOR, MINOR, TINY].join('.')
    
    def self.to_s
      STRING
    end
    
  end
  
end
