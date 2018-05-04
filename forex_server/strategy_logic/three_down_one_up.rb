# frozen_string_literal: true

require_relative 'strategy_logic'

module ForexServer
  class ThreeDownOneUp < StrategyLogic
    DOWNS = 3

    def init_data
      { count_down: 0 }
    end

    def buy?
      # Here is the place for the main logic

      # Accessible data
      # object: strategy
      # hash: last_price

      # Your data (variables, tables...) which you will use for this Strategy Logic
      # hash: data

      data[:count_down] += 1 if Candel.red?(last_price)
      log_count_down

      if Candel.green?(last_price)
        count_down = data[:count_down]
        data[:count_down] = 0

        count_down >= DOWNS
      else
        false
      end
    end

    def sell?
      is_candel_red = Candel.red?(last_price)

      if is_candel_red
        init_data
        data[:count_down] += 1
        log_count_down
      end

      is_candel_red
    end

    private

    def log_count_down
      Logger.instance.call("(#{strategy.name}) :: Count down: #{data[:count_down]}") # if data[:count_down].positive?
    end
  end
end
