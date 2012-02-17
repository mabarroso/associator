$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "associator/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "associator"
  s.version     = Associator::VERSION
  s.authors     = ["Miguel Adolfo Barroso"]
  s.email       = ["mabarroso@mabarroso.com"]
  s.homepage    = "http://github.com/mabarroso/associator"
  s.summary     = "Associate any model to any model."
  s.description = "Associate any model to any model."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.1.3"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec", "~> 2.7.0"
end
