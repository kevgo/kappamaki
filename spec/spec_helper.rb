if ENV["CI"]
  require "simplecov"
  SimpleCov.start
end

require "bundler/setup"
Bundler.setup
require "kappamaki"

RSpec.configure do |config|
  config.color = true
  config.order = "random"
  config.formatter = "documentation"
end
