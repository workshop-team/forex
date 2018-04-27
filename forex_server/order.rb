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

      def insert(strategy, price_buy)
        now = Time.now
        # TODO: fetch from Strategy.units OR set 5% of your capital if field 'units' is nil
        units = 100

        ForexServer::SqlManager.instance.call(
          ForexServer::OrdersSql.insert,
          [strategy.id, price_buy, units, now, now]
        )
      end
    end
  end
end
