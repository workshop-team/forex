# frozen_string_literal: true

require_relative 'strategy_logic'

module ForexServer
  class StrategyLogic1 < StrategyLogic
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
      false
    end
  end
end
