require 'json'

environment = ENV['environment']

template = File.read("template.rb");
template = template.gsub("#ENVIRONMENT#", environment);

ENV_JSON_PATH = "json/env.json"
file = File.read(ENV_JSON_PATH)
hash = JSON.load(file)
hash.each_pair do |key, value|
  template = template.gsub(key, value);
end

p template
File.write('write.rb', template)