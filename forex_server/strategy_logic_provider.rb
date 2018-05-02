# frozen_string_literal: true

require_relative 'sql/strategy_logic_providers_sql'

module ForexServer
  class StrategyLogicProvider
    class << self
      def data(strategy)
        result = SqlManager.instance.call(StrategyLogicProvidersSql.where_strategy_id, [strategy.id])
        result.count.zero? ? insert(strategy) : data_to_hash(result)
      end

      def insert(strategy)
        data = strategy.strategy_logic.init_data
        now = Time.now

        SqlManager.instance.call(StrategyLogicProvidersSql.insert, [strategy.id, data, now, now])
        data
      end

      def data_to_hash(result)
        return {} if result[0]['data'].nil?
        JSON.parse(result[0]['data'], symbolize_names: true)
      end

      def update(strategy, data)
        SqlManager.instance.call(StrategyLogicProvidersSql.update, [strategy.id, data.to_json])
      end
    end
  end
end
