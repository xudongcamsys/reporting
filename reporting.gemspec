$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "reporting/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "reporting"
  s.version     = Reporting::VERSION
  s.authors     = ["Xudong Liu"]
  s.email       = ["xudong.camsys@gmail.com"]
  s.homepage    = "https://github.com/xudongcamsys/reporting"
  s.summary     = "A basic and generic database querying and exporting engine."
  s.description = "A basic and generic database querying and exporting engine."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 4.0"
  s.add_dependency 'sass-rails', '~> 4.0'
  s.add_dependency "ransack"
  s.add_dependency "haml-rails", "~> 0.9"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails", '~>3.2.1'
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "database_cleaner"
end
