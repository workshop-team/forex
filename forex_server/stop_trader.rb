# frozen_string_literal: true

require 'singleton'

module ForexServer
  class StopTrader
    include Singleton

    def call(strategy, order)
      @strategy = strategy
      @order = order

      @last_current_price = oanda_last_bid_price
      @buy_price = @order[0]['price_buy'].to_f
      @current_pips = pips

      to_be_or_not_to_be?
    end

    private

    def to_be_or_not_to_be?
      if stop_loss? || take_profit?
        @strategy.strategy_logic.trader.sell(@strategy, @order)
        StrategyLogicProvider.delete(@strategy.id)

        true
      else
        false
      end
    end

    def stop_loss?
      @strategy.stop_loss.nil? ? false : @current_pips < @strategy.stop_loss.to_i
    end

    def take_profit?
      @strategy.take_profit.nil? ? false : @current_pips > @strategy.take_profit.to_i
    end

    def pips
      instrument = @strategy.instrument_name == 'usd_jpy' ? 100 : 10_000
      (@last_current_price - @buy_price) * instrument
    end

    def oanda_last_bid_price
      response = OandaApi.instance.last_current_price(@strategy.instrument_name)
      response = JSON.parse(response)

      response['prices'][0]['bids'][0]['price'].to_f
    end
  end
end
