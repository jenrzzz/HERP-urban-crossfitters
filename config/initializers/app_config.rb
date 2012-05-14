require 'yaml'

yaml_data = YAML::load(IO.read(File.join(Rails.root, 'config', 'application.yml')))
APP_CONFIG = HashWithIndifferentAccess.new yaml_data
