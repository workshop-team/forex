# frozen_string_literal: true

require_relative 'order'

module ForexServer
  class Trader
    def call(buy_sell, strategy)
      send buy_sell, strategy
    end

    def buy(strategy)
      puts "---- Buy #{strategy.instrument_name}"

      # Execute Oanda API to buy instrument

      # TODO: fetch from Strategy.units OR set 5% of your capital if field 'units' is nil
      units = 10

      response = ForexServer::OandaApi.instance.trade(strategy.instrument_name, units)

      # save Order
      ForexServer::Order.insert(strategy, order_response_info(response))
    end

    def sell(strategy)
      puts "---- Sell #{strategy.instrument_name}"

      # TODO: execute Oanda API to sell instrument
      units = -10

      response = ForexServer::OandaApi.instance.trade(strategy.instrument_name, units)

      # Update Order record (save price_sell)
      ForexServer::Order.update(strategy, order_response_info(response))

      # Remove Strategy from FS
      ForexServer::Strategies.instance.delete(strategy.id)

      # TODO: Set strategy 'status' to 'done' in DB. (add field status to Strategy)
    end

    private

    def order_response_info(response)
      response = JSON.parse(response)['orderFillTransaction'] # symbolize_names: true

      {
        order_id: response['orderID'],
        price: response['price'],
        time: response['time'],
        units: response['units']
      }
    end
  end
end
