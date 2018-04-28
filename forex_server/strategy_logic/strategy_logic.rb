# frozen_string_literal: true

require_relative '../data_collector'
require_relative '../order'

module ForexServer
  class StrategyLogic
    attr_accessor :strategy, :last_price

    def initialize
      @trader = ForexServer::Trader.new
      @data_collector = ForexServer::DataCollector.new
    end

    def call(strategy)
      @strategy = strategy
      @last_price = @data_collector.call(strategy)

      puts "--- Run #{strategy.class_name} (#{strategy.name})"

      order_exist = ForexServer::Order.exist?(strategy)

      @trader.call(:sell, strategy) if order_exist && sell?
      @trader.call(:buy, strategy) if !order_exist && buy?
    end
  end
end
