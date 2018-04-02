# frozen_string_literal: true

module ForexServer
  class Trader
    def call(buy_sell, strategy)
      send buy_sell, strategy
    end

    def buy(strategy)
      puts "---- Buy #{strategy.instrument}"
      ForexServer::Logger.instance.call("---- Buy #{strategy.instrument} ")
    end

    def sell(strategy)
      puts "---- Sell #{strategy.instrument}"
      ForexServer::Logger.instance.call("---- Sell #{strategy.instrument} ")
    end
  end
end
