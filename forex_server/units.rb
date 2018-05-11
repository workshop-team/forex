# frozen_string_literal: true

module ForexServer
  class Units
    PERCENT = 0.01 # 1%
    class << self
      def value(strategy)
        strategy.units.nil? ? calculate : strategy.units
      end

      def calculate
        (PERCENT * account_balance).to_i
      end

      private

      def account_balance
        response = OandaApi.instance.account_summary
        JSON.parse(response)['account']['balance'].to_f
      end
    end
  end
end
