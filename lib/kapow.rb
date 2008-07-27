module Kapow

  %w(version response message credit).each do |lib|
    require File.join(File.dirname(__FILE__), 'kapow', lib)
  end

end