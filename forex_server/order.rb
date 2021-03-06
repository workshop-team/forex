# frozen_string_literal: true

require_relative 'sql/orders_sql'

module ForexServer
  class Order
    class << self
      def insert(strategy, buy_info)
        now = Time.now
        time = Time.at(buy_info[:time].to_i)

        SqlManager.instance.call(
          OrdersSql.insert,
          [strategy.id, buy_info[:price], time, buy_info[:order_id], buy_info[:units], now, now]
        )
      end

      def update(strategy, sell_info)
        time = Time.at(sell_info[:time].to_i)

        SqlManager.instance.call(
          OrdersSql.update,
          [strategy.id, sell_info[:price], time, sell_info[:order_id], sell_info[:pl], sell_info[:half_spread_cost]]
        )
      end

      def active_strategy(strategy)
        SqlManager.instance.call(OrdersSql.active_strategy, [strategy.id])
      end
    end
  end
end
