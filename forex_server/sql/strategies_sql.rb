# frozen_string_literal: false

module ForexServer
  class StrategiesSql
    class << self
      def strategies
        <<-QUERY
          SELECT s.id, s.name AS strategy_name, g.value, s.instrument_id,
          sl.class_name , i.name AS instrument_name,
          g.name AS granularity_name, s.units
          FROM strategies AS s
          JOIN strategy_logics AS sl ON sl.id = s.strategy_logic_id
          JOIN instruments AS i ON i.id = s.instrument_id
          JOIN granularities AS g ON g.id = s.granularity_id
        QUERY
      end

      def strategy_with_id
        strategies << 'WHERE s.id = $1'
      end

      def strategies_with_status_created
        strategies << 'WHERE status = 0'
      end

      def update_to_finished
        <<-QUERY
          UPDATE strategies
          SET status = 2
          WHERE id = $1
        QUERY
      end
    end
  end
end
