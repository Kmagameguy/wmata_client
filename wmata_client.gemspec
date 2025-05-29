require "pathname"
require_relative "lib/wmata_client/version"

Gem::Specification.new do |spec|
  spec.name    = "wmata_client"
  spec.version = WmataClient::VERSION
  spec.platform = Gem::Platform::RUBY
  spec.authors = ["Kmagameguy"]
  spec.description = "Retrieve information from the Washington Metropolitan Area Transit Authority API"
  spec.summary = "A Ruby client for the WMATA API"
  spec.homepage = "https://github.com/kmagameguy/wmata_api"

  spec.files = ::Dir.glob(::Pathname.new(__dir__).join("lib/**/**")).reject do |file|
    file.match(%r{^(test)/}) || ::File.directory?(file)
  end

  spec.bindir = "bin"
  spec.executables = spec.files.grep(%r{^bin/}) { |file| File.basename(file) }
  spec.require_paths = ["lib"]
  
  spec.add_dependency("dotenv")
  spec.add_dependency("faraday")
  spec.add_dependency("activesupport")
  spec.add_dependency("bundler")
  
  spec.add_development_dependency("minitest")
  spec.add_development_dependency("minitest-reporters")
  spec.add_development_dependency("minitest-focus")
  spec.add_development_dependency("pry")
  spec.add_development_dependency("pry-byebug")
end