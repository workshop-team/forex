# frozen_string_literal: true

module ForexServer
  class PricesSql
    def self.insert_price
      <<-QUERY
        INSERT INTO prices
        (strategy_id, volume, time, open, high, low, close, created_at, updated_at)
        VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9)
      QUERY
    end
  end
end
