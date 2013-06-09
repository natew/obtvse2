source 'https://rubygems.org'

gem 'rails', '~> 3.2'

# Auth/users
gem 'sorcery', '0.7'
gem 'bcrypt-ruby', '~> 3.0.0'

# Frontend Utilities
gem 'slim', '~> 1.2'
gem 'turbolinks', '~> 1.0'
gem 'jquery-rails', '~> 2'
gem 'compass-rails'

# Markdown
gem 'kramdown', '~> 1.0', require: false
gem 'coderay', '~> 1.0'

# Pagination
gem 'kaminari', '~> 0.14'

# Date/URL Utilities
gem 'chronic', '~> 0.8'
gem 'stringex', '~> 2', github: 'rsl/stringex'

platform :jruby do
  gem 'trinidad'
  gem 'activerecord-jdbcpostgresql-adapter'
end

platform :ruby do
  gem 'pg', '~> 0.14'
  gem 'unicorn'
end

group :production do
  gem 'aws-sdk', '~> 1.3.4'
end

group :development, :test do
  gem 'sqlite3', '~> 1', platform: [:ruby, :mswin, :mingw]
  gem 'capistrano'
  gem 'capistrano_colors'
  gem 'quiet_assets'
  gem 'guard-livereload', require: false
  gem 'rack-livereload'
  gem 'rb-fsevent', require: false
end

group :assets do
  gem 'sass-rails', '~> 3'
  gem 'coffee-rails', '~> 3'
  gem 'uglifier', '~> 1'
end
