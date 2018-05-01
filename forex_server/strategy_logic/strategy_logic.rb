# frozen_string_literal: true

require_relative '../data_collector'
require_relative '../order'

module ForexServer
  class StrategyLogic
    attr_accessor :strategy, :last_price

    def initialize
      @trader = Trader.new
      @data_collector = DataCollector.new
    end

    def call(strategy)
      @strategy = strategy
      @last_price = @data_collector.call(strategy)

      puts "--- Run #{strategy.class_name} (#{strategy.name})"

      order = Order.where_strategy_id(strategy)
      order_exist = order.count == 1

      @trader.buy(strategy) if !order_exist && buy?
      @trader.sell(strategy, order) if order_exist && sell?
    end
  end
end
