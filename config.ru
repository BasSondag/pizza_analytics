require File.expand_path('config/environment', __dir__)

db_config_file = File.join(File.dirname(__FILE__), 'config', 'database.yml')
if File.exist?(db_config_file)
  config = YAML.load(File.read(db_config_file))
  DB = Sequel.connect(config)
  Sequel.extension :migration
end
if DB
  Sequel::Migrator.run(DB, File.join(File.dirname(__FILE__), 'migrations'))
end

# Load models
Dir[File.join(File.dirname(__FILE__), 'app/models', '**', '*.rb')].sort.each {|file| require file }
run Base::App.instance
