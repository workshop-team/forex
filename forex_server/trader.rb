# frozen_string_literal: true

require_relative 'order'
require_relative 'units'

module ForexServer
  class Trader
    def buy(strategy)
      puts "---- Buy #{strategy.instrument_name}"

      # Execute Oanda API to buy instrument
      response = OandaApi.instance.trade(strategy.instrument_name, Units.value(strategy))

      # Save Order
      Order.insert(strategy, order_response_info(response))

      Logger.call(
        "#{strategy.instrument_name.upcase} (#{strategy.name}) was bought", 'success'
      )
    end

    def sell(strategy, order)
      puts "---- Sell #{strategy.instrument_name}"

      # Execute Oanda API to sell instrument
      response = OandaApi.instance.trade(strategy.instrument_name, bought_units(order))

      # Update Order record (save price_sell)
      update_order_record(strategy, response)

      Logger.call(
        "#{strategy.instrument_name.upcase} (#{strategy.name}) was sold", 'success'
      )
    end

    private

    def order_response_info(response)
      response = JSON.parse(response)['orderFillTransaction']

      {
        order_id: response['orderID'],
        price: response['price'],
        time: response['time'],
        units: response['units']
      }
    end

    def bought_units(order)
      order[0]['units'].to_i * -1
    end

    def update_order_record(strategy, response)
      Order.update(strategy, order_response_info(response))
    end
  end
end
