# frozen_string_literal: true

require_relative 'strategy_logic'

module ForexServer
  class TwoUp < StrategyLogic
    UPS = 2

    def init_data
      { count_up: 0 }
    end

    def buy?
      # Here is the place for the main logic

      # Accessible data
      # object: strategy
      # hash: last_price

      # Your data (variables, tables...) which you will use for this Strategy Logic
      # hash: data

      data[:count_up] += 1 if Candel.green?(last_price)
      data[:count_up] = 0 if Candel.red?(last_price)

      log_count_up
      data[:count_up] == UPS
    end

    def sell?
      is_candel_red = Candel.red?(last_price)
      data[:count_up] = 0 if is_candel_red
      log_count_up

      is_candel_red
    end

    private

    def log_count_up
      Logger.call("(#{strategy.name}) :: Count up: #{data[:count_up]}")
    end
  end
end
