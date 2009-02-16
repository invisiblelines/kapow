%w(rubygems spec).each { |lib| require lib }

require File.dirname(__FILE__) + '/../lib/kapow'

Spec::Runner.configure do |config|
  config.mock_with :mocha
end