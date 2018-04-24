# frozen_string_literal: true

module ForexServer
  class Trader
    def call(buy_sell, strategy)
      send buy_sell, strategy
    end

    def buy(strategy)
      puts "---- Buy #{strategy.instrument_name}"
    end

    def sell(strategy)
      puts "---- Sell #{strategy.instrument_name}"
    end
  end
end
