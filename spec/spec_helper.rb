require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

require 'simplecov'
SimpleCov.start

require 'rspec'
require 'kapow'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
