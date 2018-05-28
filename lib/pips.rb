# frozen_string_literal: true

module Forex
  class Pips
    class << self
      def calculate(instrument, buy_price, sell_price)
        (sell_price - buy_price) * pip_size(instrument)
      end

      def pip_size(instrument)
        instrument.casecmp('USD_JPY').zero? ? 100 : 10_000
      end
    end
  end
end
