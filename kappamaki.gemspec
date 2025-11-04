lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |gem|
  gem.name     = "kappamaki"
  gem.version  = "1.0.0"
  gem.authors  = ["Kevin Goslar"]
  gem.email    = ["kevin.goslar@gmail.com"]
  gem.summary  = "Tools for defining data using natural language in Cucumber steps"
  gem.homepage = "https://github.com/kevgo/kappamaki"
  gem.license  = "MIT"
  gem.description = <<-DESC
    Kappamaki is a collection of string manipulation methods
    that make parsing high-level cucumber steps easier.
  DESC

  gem.files         = `git ls-files -z`.split("\x0")
  gem.executables   = []
  gem.require_paths = ["lib"]

  gem.required_ruby_version = ">= 2.0"
  gem.metadata["rubygems_mfa_required"] = "true"
end
