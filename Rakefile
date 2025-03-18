require 'bundler'
require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new :spec

task default: [:lint, :spec]

desc 'Run linter'
task 'lint' do
  sh 'bundle exec rubocop'
end
