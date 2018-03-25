# frozen_string_literal: true

module ForexServer
  class DataCollectorSql
    def self.insert_price
      <<-QUERY
        INSERT INTO prices
        (instrument, ask, bid, time, created_at, updated_at)
        VALUES ($1, $2, $3, $4, $5, $6)
      QUERY
    end
  end
end
