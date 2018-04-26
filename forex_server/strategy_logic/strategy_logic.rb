# frozen_string_literal: true

require_relative '../data_collector'

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
      bs = buy_sell
      @trader.call(bs, strategy) unless bs.nil?
    end
  end
end
