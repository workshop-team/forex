# frozen_string_literal: true

require_relative 'sql/data_collector_sql'

module ForexServer
  class DataCollector
    def save
      puts '-- Save instruments data'
      ForexServer::SqlManager.instance.call(
        ForexServer::DataCollectorSql.insert_price,
        [0, 1.009, 1.0013, Time.now, Time.now, Time.now]
      )
    end
  end
end
