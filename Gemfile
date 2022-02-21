# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'rails', '~> 5.2.0'

gem 'bootsnap', '>= 1.1.0', require: false
gem 'bootstrap-sass', '~> 3.3.7'
gem 'cancancan', '~> 2.0'
gem 'coffee-rails', '~> 4.2'
gem 'daemons', '~> 1.2', '>= 1.2.6'
gem 'devise'
gem 'draper'
gem 'font-awesome-rails'
gem 'haml-rails', '~> 1.0'
gem 'http'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'kaminari'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.3'
gem 'redis', '~> 3.0'
gem 'rubocop', require: false
gem 'sass-rails', '~> 5.0'
gem 'simple_form'
gem 'skylight'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  gem 'awesome_print'
  gem 'dotenv-rails'
  gem 'factory_bot_rails', '~> 4.0'
  gem 'haml_lint', '~> 0.27.0', require: false
  gem 'pry-byebug'
  gem 'rspec-rails', '~> 3.7'
  gem 'rspec_junit_formatter'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
end

group :test do
  gem 'database_cleaner'
  gem 'rails-controller-testing'
  gem 'shoulda-matchers', '~> 3.1'
end

group :development do
  gem 'brakeman', require: false
  gem 'capistrano', '~> 3.10', require: false
  gem 'capistrano-bundler', '~> 1.3.0'
  gem 'capistrano-passenger', '~> 0.2'
  gem 'capistrano-rails', '~> 1.3.1'
  gem 'capistrano-rvm', '~> 0.1.2'
  gem 'capistrano-scm-gitcopy', '~> 0.1.5'
  gem 'guard-rspec', require: false
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'overcommit', require: false
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
