%w(rubygems rake rake/rdoctask fileutils).each { |lib| require lib }

begin
  require 'spec/rake/spectask'
rescue LoadError
  puts 'To use rspec for testing you must install rspec gem:'
  puts '$ sudo gem install rspec'
  exit
end

include FileUtils
require File.join(File.dirname(__FILE__), 'lib', 'kapow', 'version')
 
AUTHOR = 'Kiean Johnson'
EMAIL = "kieran[AT]invisiblelines.com"
DESCRIPTION = "Ruby library for Kapow SMS gateway service."
GEM_NAME = 'kapow'

Rake::RDocTask.new('docs') do |rd|
  rd.main = 'README.txt'
  rd.rdoc_files.include('README', 'History.txt', 'License.txt', 'lib/**/*.rb')
  rd.rdoc_dir = 'doc'
  rd.options << '--style=http://clickatell.rubyforge.org/stylesheets/rdoc.css'
  rd.options << '--tab-width=2'
  rd.options << '--inline-source'
  rd.options << '--line-numbers'
end

namespace :spec do
  desc "Run the specs under spec"
  Spec::Rake::SpecTask.new('all') do |t|
    t.spec_opts = ['--options', "spec/spec.opts"]
    t.spec_files = FileList['spec/*_spec.rb']
  end
  
  desc "Run the specs under spec in specdoc format"
  Spec::Rake::SpecTask.new('doc') do |t|
    t.spec_opts = ['--format', "specdoc"]
    t.spec_files = FileList['spec/*_spec.rb']
  end
  
  desc "Run the specs in HTML format"
  Spec::Rake::SpecTask.new('html') do |t|
    t.spec_files = FileList['spec/*_spec.rb']
    t.spec_opts = ['--format', "html:website/specs.html"]
  end
end
 
desc "Default task is to run specs"
task :default => 'spec:all'
  