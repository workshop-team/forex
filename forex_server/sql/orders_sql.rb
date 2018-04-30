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

      def where_strategy_id
        <<-QUERY
          SELECT * FROM orders
          WHERE strategy_id = $1
        QUERY
      end

      def insert
        <<-QUERY
          INSERT INTO orders
          (strategy_id, price_buy, time_buy, oanda_buy_order_id, units, created_at, updated_at)
          VALUES ($1, $2, $3, $4, $5, $6, $7)
        QUERY
      end

      def update
        <<-QUERY
          UPDATE orders
          SET
          price_sell = $2,
          time_sell = $3,
          oanda_sell_order_id = $4
          WHERE strategy_id = $1
        QUERY
      end
    end
  end
end
