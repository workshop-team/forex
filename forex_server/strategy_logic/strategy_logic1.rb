# frozen_string_literal: true

require_relative 'strategy_logic'
require_relative '../trader'

module ForexServer
  class StrategyLogic1 < ForexServer::StrategyLogic
    def buy?
      # Here is the place for the main logic

      # Accessible data
      # object: strategy
      # hash: last_price

      # should return true/false
      true
    end

    def sell?
      true
    end
  end
end
