# frozen_string_literal: true

require_relative 'sql/prices_sql'

module ForexServer
  class DataCollector
    def save
      puts '-- Save instruments data'

      current_time = Time.now

      ForexServer::SqlManager.instance.call(
        ForexServer::PricesSql.insert_price,
        [0, 1.009, 1.0013, current_time, current_time, current_time]
      )
    end
  end
end
