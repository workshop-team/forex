# frozen_string_literal: true

module ForexServer
  class StrategyLogic
    attr_accessor :strategy

    def initialize
      @trader = ForexServer::Trader.new
    end

    def call(strategy)
      @strategy = strategy

      puts "--- Run Strategy Logic 1 (#{strategy.name})"
      bs = buy_sell
      @trader.call(bs, strategy) unless bs.nil?
    end
  end
end