# frozen_string_literal: true

require_relative 'sql/prices_sql'

module ForexServer
  class DataCollector
    def call(strategy)
      @strategy = strategy
      puts "-- Fetch and save instruments data from strategy #{@strategy.name}"

      current_time = Time.now
      query_array = [] << @strategy.id << fetch_last_complete_price.values << current_time << current_time

      ForexServer::SqlManager.instance.call(ForexServer::PricesSql.insert_price, query_array.flatten!)
    end

    private

    def fetch_last_complete_price
      result =
        ForexServer::OandaApi.instance.last_price(
          @strategy.instrument_name.upcase, count: 2, granularity: @strategy.granularity_name, smooth: true
        )

      convert_json_result_to_hash(result)
    end

    def convert_json_result_to_hash(result)
      result = JSON.parse(result)['candles'][0]

      {
        volume: result['volume'],
        time: convert_unix_time_to_ror_date(result['time']),
        open: result['mid']['o'],
        high: result['mid']['h'],
        low: result['mid']['l'],
        close: result['mid']['c']
      }
    end

    def convert_unix_time_to_ror_date(unix_time)
      Time.at(unix_time.to_i)
    end
  end
end
