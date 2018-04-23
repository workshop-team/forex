# frozen_string_literal: true

server(
  'forex.biegokracja.pl', user: 'forex', roles: %w[app db web]
)

set :rails_env, 'production'
set :rvm_ruby_version, '2.5.1'

set :branch, 'master'
