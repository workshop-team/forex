# frozen_string_literal: true

module ForexServer
  class StrategiesSql
    def self.strategies
      <<-QUERY
        SELECT s.id, s.name AS strategy_name, s.time_range, s.instrument_id,
        sl.class_name , i.name AS instrument_name
        FROM strategies AS s
        JOIN strategy_logics AS sl ON sl.id = s.strategy_logic_id
        JOIN instruments AS i ON i.id = s.instrument_id
      QUERY
    end
  end
end
