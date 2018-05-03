# frozen_string_literal: true

require_relative 'strategy_logic'

module ForexServer
  class ThreeDownOneUp < StrategyLogic
    def init_data
      {
        count_down: 0
      }
    end

    def buy?
      # Here is the place for the main logic

      # Accessible data
      # object: strategy
      # hash: last_price

      # Your data (variables, tables...) which you will use for this Strategy Logic
      # hash: data

      data[:count_down] += 1 if Candel.red?(last_price)

      if Candel.green?(last_price)
        count_down = data[:count_down]
        data[:count_down] = 0

        count_down >= 3
      else
        false
      end
    end

    def sell?
      Candel.red?(last_price)
    end
  end
end
