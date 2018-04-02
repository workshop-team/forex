# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'rails', '~> 5.2.0.rc1'

gem 'bootsnap', '>= 1.1.0', require: false
gem 'bootstrap', '~> 4.0.0'
gem 'coffee-rails', '~> 4.2'
gem 'daemons', '~> 1.2', '>= 1.2.6'
gem 'haml-rails', '~> 1.0'
gem 'http'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'redis', '~> 3.0'
gem 'rubocop', require: false
gem 'sass-rails', '~> 5.0'
gem 'simple_form'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  gem 'awesome_print'
  gem 'factory_bot_rails', '~> 4.0'
  gem 'haml_lint', '~> 0.27.0', require: false
  gem 'pry-byebug'
  gem 'rspec-rails', '~> 3.7'
end

group :test do
  gem 'database_cleaner'
  gem 'shoulda-matchers', '~> 3.1'
end

group :development do
  gem 'brakeman', require: false
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'overcommit', require: false
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
