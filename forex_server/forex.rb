# frozen_string_literal: true

require_relative 'heart'
require_relative 'data_collector'
require_relative 'strategies'
require_relative 'strategy_logic/strategy_logic1'
require_relative 'manager'
require_relative 'sql_manager'

#### Start ####
# Forex Server is automative started with Rails. But in development it's better to run it using CLI.
# ruby forex_server/forex_daemon.rb run
# ruby forex_server/forex_daemon.rb run | stop | start | status

data_collector = ForexServer::DataCollector.new
strategies = ForexServer::Strategies.new
manager = ForexServer::Manager.new(strategies)

ForexServer::Heart.new(5) do
  data_collector.save
  manager.call
  strategies.call
end
