$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "kapow/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name          = "kapow"
  s.version       = Kapow::VERSION
  s.authors       = ["Kieran Johnson"]
  s.email         = ["hello@invisiblelines.com"]
  s.homepage      = "http://github.com/invisiblelines/kapow"
  s.summary       = "Ruby library for sending SMS messages using the Kapow SMS gateway service."
  s.description   = s.summary

  s.files         = Dir['Gemfile', 'README.rdoc', 'Rakefile', 'History.txt', 'License.txt', 'lib/**/*']
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_development_dependency 'rspec', '3.1.0'
end
