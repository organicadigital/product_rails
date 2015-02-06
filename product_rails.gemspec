$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "product_rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "product_rails"
  s.version     = ProductRails::VERSION
  s.authors     = ["Orgânica Digital"]
  s.email       = ["contato@organicadigital.com.com"]
  s.homepage    = "https://github.com/organicadigital/product_rails"
  s.summary     = "A simple product representation for Rails applications."
  s.description = "A simple product representation for Rails applications."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.0"
  s.add_dependency 'friendly_id', '~> 5.1.0'
  s.add_development_dependency "mysql2"
end
