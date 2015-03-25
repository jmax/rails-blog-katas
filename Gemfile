source 'https://rubygems.org'

ruby "2.1.3"

# Rails
gem 'rails', '4.1.8'


# Setup
gem 'figaro'


# Plugins
gem 'decent_exposure'


# Frontend
gem 'sass-rails',   '~> 4.0.3'
gem 'uglifier',     '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'


# Development
group :development do
  gem 'sqlite3'
  gem 'spring'
  gem 'quiet_assets'
  gem 'puma'
  gem 'ffaker'
end

group :development, :test do
  gem 'rspec-rails',        '~> 2.14.0'
  gem "factory_girl_rails", '4.2.1'
end


# Test suite
group :test do
  gem 'capybara'
  gem 'capybara-email'
  gem 'database_cleaner',       '~> 1.3.0'
  gem 'simplecov',            require: false
  gem 'launchy'
  gem 'shoulda-matchers',     require: false
end


# Misc
gem 'sdoc', '~> 0.4.0', group: :doc
