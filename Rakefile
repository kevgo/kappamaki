require "bundler"
require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new :spec

task default: [:lint, :spec]

desc "Fix all auto-fixable issues"
task "fix" do
  sh "bundle exec rubocop -a"
  sh "dprint fmt"
end

desc "Run linter"
task "lint" do
  sh "bundle exec rubocop"
  sh "dprint check"
end
