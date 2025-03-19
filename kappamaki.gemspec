lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name     = "kappamaki"
  spec.version  = "1.0.0"
  spec.authors  = ["Kevin Goslar"]
  spec.email    = ["kevin.goslar@gmail.com"]
  spec.summary  = "Tools for defining data using natural language in Cucumber steps"
  spec.homepage = "https://github.com/kevgo/kappamaki"
  spec.license  = "MIT"
  spec.description = <<-DESC
    Kappamaki is a collection of string manipulation methods
    that make parsing high-lever cucumber steps easier.
  DESC

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = []
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.0"
  spec.metadata["rubygems_mfa_required"] = "true"
end
