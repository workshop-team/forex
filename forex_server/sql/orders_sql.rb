# frozen_string_literal: true

module ForexServer
  class OrdersSql
    class << self
      def count
        <<-QUERY
          SELECT COUNT(*) AS count FROM orders
          WHERE strategy_id = $1
        QUERY
      end

      def insert
        <<-QUERY
          INSERT INTO orders
          (strategy_id, price_buy, units, created_at, updated_at)
          VALUES ($1, $2, $3, $4, $5)
        QUERY
      end
    end
  end
end
