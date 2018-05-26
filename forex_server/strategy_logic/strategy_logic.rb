# frozen_string_literal: true

require_relative '../trader'
require_relative '../data_collector'
require_relative '../order'
require_relative '../strategy_logic_provider'
require_relative 'functions/candel'

module ForexServer
  class StrategyLogic
    attr_accessor :strategy, :last_price, :data
    attr_reader :trader

    def initialize(strategy)
      @trader = Trader.new
      @data_collector = DataCollector.new
      @strategy = strategy
    end

    def call(order)
      @order = order

      puts "--- Run #{strategy.class_name} (#{strategy.name})"

      @last_price = @data_collector.call(strategy)

      execute_trade { trade }
    end

    private

    def trade
      @trader.buy(strategy) if !order_exist? && buy?
      @trader.sell(strategy, @order) if order_exist? && sell?
    end

    def execute_trade
      @data = StrategyLogicProvider.data(strategy)
      yield
      StrategyLogicProvider.update(strategy, @data)
    end

    def order_exist?
      @order.count == 1
    end
  end
end
