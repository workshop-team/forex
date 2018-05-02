# frozen_string_literal: true

module ForexServer
  class StrategyLogicProvidersSql
    class << self
      def where_strategy_id
        <<-QUERY
          SELECT data FROM strategy_logic_providers
          WHERE strategy_id = $1
        QUERY
      end

      def update
        <<-QUERY
          UPDATE strategy_logic_providers
          SET data = $2
          WHERE strategy_id = $1
        QUERY
      end

      def insert
        <<-QUERY
          INSERT INTO strategy_logic_providers (strategy_id, data, created_at, updated_at)
          VALUES($1, $2, $3, $4)
        QUERY
      end
    end
  end
end
