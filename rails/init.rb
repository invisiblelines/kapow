require 'yaml'

if File.exists?(File.join(RAILS_ROOT, 'config', 'kapow.yml'))
  kapow = YAML.load_file(File.join(RAILS_ROOT, 'config', 'kapow.yml')) 
  kapow = kapow[RAILS_ENV].symbolize_keys

  KAPOW_USER = kapow[:username]
  KAPOW_PASS = kapow[:password]
end

require 'kieranj-kapow'