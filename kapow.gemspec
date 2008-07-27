Gem::Specification.new do |s|
  s.name     = "kapow"
  s.version  = "0.1.0"
  s.date     = "2008-07-27"
  s.summary  = "Ruby library for Kapow SMS gateway service"
  s.email    = "kieran[AT]invisiblelines.com"
  s.homepage = "http://github.com/kieranj/kapow"
  s.description = "Ruby library for sending SMS messages using the Kapow SMS gateway service."
  s.has_rdoc = true
  s.authors  = ["Kieran Johnson"]
  s.files    = ["History.txt", 
		"Readme.txt", 
		"Rakefile", 
		"kapow.gemspec", 
		"lib/kapow.rb",
		"lib/kapow/message.rb",
		"lib/kapow/response.rb",
		"lib/kapow/credit.rb",
		"lib/kapow/version.rb"]
	s.test_files = ["spec/message_spec.rb", "spec/response_spec.rb"]
  s.rdoc_options = ["--main", "Readme.txt"]
  s.extra_rdoc_files = ["History.txt", "Readme.txt"]
end