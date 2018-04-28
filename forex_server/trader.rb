# frozen_string_literal: true

require_relative 'order'

module ForexServer
  class Trader
    def call(buy_sell, strategy)
      send buy_sell, strategy
    end

    def buy(strategy)
      puts "---- Buy #{strategy.instrument_name}"

      # TODO: execute Oanda API to buy instrument
      price_buy = 1.4566

      # save Order
      ForexServer::Order.insert(strategy, price_buy)
    end

    def sell(strategy)
      puts "---- Sell #{strategy.instrument_name}"

      # TODO: execute Oanda API to sell instrument
      # remove Strategy from FS
      ForexServer::Strategies.instance.delete(strategy.id)

      # TODO: Set strategy 'status' to 'done' in DB. (add field status to Strategy)
      # TODO: Update Order record (save price_sell)
    end
  end
end
