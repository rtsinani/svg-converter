$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "svg_converter/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "svg_converter"
  s.version     = SvgConverter::VERSION
  s.authors     = ["Artan Sinani"]
  s.email       = ["artisinani@yahoo.co.uk"]
  s.homepage    = ""
  s.summary     = "Converts SVG to PNG, JPG, PDF using the Batik java library."
  s.description = "Converts SVG to PNG, JPG, PDF using the Batik java library."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.1.3"

  s.add_development_dependency "sqlite3"
end
