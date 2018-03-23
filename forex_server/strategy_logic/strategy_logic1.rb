# frozen_string_literal: true

require_relative 'strategy_logic'
require_relative '../trader'

module ForexServer
  class StrategyLogic1 < ForexServer::StrategyLogic
    def buy_sell
      # here is the place for the main logic
      # strategy - object

      # returns :buy/:sell/nil
      %i[buy sell].sample
    end
  end
end
