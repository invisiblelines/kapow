Gem::Specification.new do |s|
  s.name     = "kapow"
  s.version  = "0.3.0"
  s.date     = "2008-08-13"
  s.summary  = "Ruby library for Kapow SMS gateway service"
  s.email    = "kieran[AT]invisiblelines.com"
  s.homepage = "http://github.com/kieranj/kapow"
  s.rubyforge_project = "kapow"
  s.description = "Ruby library for sending SMS messages using the Kapow SMS gateway service."
  s.has_rdoc = true
  s.authors  = ["Kieran Johnson"]
  s.files    = ["History.txt", 
		"Readme.rdoc", 
		"Rakefile",
		"init.rb", 
		"kapow.gemspec", 
		"lib/kapow.rb",
		"lib/kapow/sms.rb",
		"lib/kapow/response.rb",
		"lib/kapow/credit.rb",
		"lib/kapow/version.rb"]
	s.test_files = ["spec/sms_spec.rb", "spec/response_spec.rb"]
  s.rdoc_options = ["--main", "Readme.rdoc"]
  s.extra_rdoc_files = ["Readme.rdoc"]
end