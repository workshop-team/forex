# frozen_string_literal: true

require_relative 'sql/orders_sql'

module ForexServer
  class Order
    class << self
      def exist?(strategy)
        ForexServer::SqlManager.instance.call(
          ForexServer::OrdersSql.count, [strategy.id]
        )[0]['count'].to_i == 1
      end

      def insert(strategy, buy_info)
        now = Time.now
        time = Time.at(buy_info[:time].to_i)

        ForexServer::SqlManager.instance.call(
          ForexServer::OrdersSql.insert,
          [strategy.id, buy_info[:price], time, buy_info[:order_id], buy_info[:units], now, now]
        )
      end

      def update(strategy, sell_info)
        time = Time.at(sell_info[:time].to_i)

        ForexServer::SqlManager.instance.call(
          ForexServer::OrdersSql.update,
          [strategy.id, sell_info[:price], time, sell_info[:order_id]]
        )
      end
    end
  end
end
