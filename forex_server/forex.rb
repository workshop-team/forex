# frozen_string_literal: true

require_relative 'heart'
require_relative 'data_collector'
require_relative 'strategies'
require_relative 'strategy_logic/strategy_logic1'
require_relative 'manager'
require_relative 'sql_manager'
require_relative 'logger'
require_relative 'api/localhost_api'

#### Start ####
# Forex Server is automative started with Rails. But in development it's better to run it using CLI.
# ruby forex_server/forex_daemon.rb run
# ruby forex_server/forex_daemon.rb run | stop | start | status

ForexServer::Logger.instance.call('+++ Forex Server started +++')

data_collector = ForexServer::DataCollector.new
manager = ForexServer::Manager.new

ForexServer::Heart.new(5) do
  data_collector.save
  manager.call
  ForexServer::Strategies.instance.call
end
