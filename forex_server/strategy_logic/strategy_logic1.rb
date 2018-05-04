# frozen_string_literal: true

require_relative 'strategy_logic'

module ForexServer
  class StrategyLogic1 < StrategyLogic
    def init_data
      # Add initial 'data' to hash
      {}
    end

    def buy?
      # Here is the place for the main logic

      # Accessible data
      # object: strategy
      # hash: last_price

      # Your data (variables, tables...) which you will use for this Strategy Logic
      # hash: data

      # should return true/false
      false
    end

    def sell?
      # init_data if true # Will reset the data hash for new Order.
      false
    end
  end
end
