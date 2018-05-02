# frozen_string_literal: true

require_relative '../trader'
require_relative '../data_collector'
require_relative '../order'
require_relative '../strategy_logic_provider'

module ForexServer
  class StrategyLogic
    attr_accessor :strategy, :last_price, :data

    def initialize(strategy)
      @trader = Trader.new
      @data_collector = DataCollector.new
      @strategy = strategy
    end

    def call
      @last_price = @data_collector.call(strategy)

      puts "--- Run #{strategy.class_name} (#{strategy.name})"

      @order = Order.where_strategy_id(strategy)
      @data = StrategyLogicProvider.data(strategy)

      trade

      StrategyLogicProvider.update(strategy, @data)
    end

    def trade
      @trader.buy(strategy) if !order_exist? && buy?
      @trader.sell(strategy, @order) if order_exist? && sell?
    end

    def order_exist?
      @order.count == 1
    end
  end
end
