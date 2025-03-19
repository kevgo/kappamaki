# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name     = 'kappamaki'
  spec.version  = '1.0.0'
  spec.authors  = ['Kevin Goslar']
  spec.email    = ['kevin.goslar@gmail.com']
  spec.summary  = 'Tools for defining data using natural language in Cucumber steps'
  spec.homepage = 'https://github.com/kevgo/kappamaki'
  spec.license  = 'MIT'
  spec.description = <<-EOF
    Kappamaki is a collection of string manipulation methods
    that make parsing high-lever cucumber steps easier.
  EOF

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = []
  spec.test_files    = spec.files.grep('spec')
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'simplecov'

  spec.required_ruby_version = '>= 1.9.3'
end
