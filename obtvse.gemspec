$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "obtvse/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "obtvse"
  s.version     = Obtvse::VERSION
  s.authors     = ["Nathan Wienert"]
  s.email       = ["natewienert@gmail.com"]
  s.homepage    = "https://github.com/natew/obtvse2"
  s.summary     = "So Obtvse"
  s.description = "Obtvse"
  s.license     = "MIT"

  s.files = Dir["{app,bin,config,db,lib,public,vendor}/**/*", "MIT-LICENSE.txt", "Rakefile", "README.md"]
  s.require_paths = ['lib']
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1.1"
  s.add_dependency 'rails_12factor'
  s.add_dependency 'sorcery'
  s.add_dependency 'bcrypt-ruby', '~> 3.0.0'

  # Frontend Utilities
  s.add_dependency 'slim', '~> 1.2'
  s.add_dependency 'turbolinks', '~> 1.0'
  s.add_dependency 'jquery-rails', '~> 2'
  s.add_dependency 'compass-rails', '~> 1.1'

  # Markdown
  s.add_dependency 'kramdown', '~> 1.0'
  s.add_dependency 'coderay', '~> 1.0'

  # Pagination
  s.add_dependency 'kaminari', '~> 0.14'

  # Date/URL Utilities
  s.add_dependency 'chronic', '~> 0.8'
  s.add_dependency 'stringex', '~> 2.5'

  s.add_dependency 'pg', '~> 0.14'
  s.add_dependency 'unicorn'
  s.add_dependency 'aws-sdk', '~> 1.3.4'

  s.add_development_dependency 'sqlite3'
end
