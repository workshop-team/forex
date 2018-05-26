# frozen_string_literal: true

require_relative 'sql/prices_sql'

module ForexServer
  class DataCollector
    def call(strategy)
      @strategy = strategy
      puts "-- Fetch and save instruments data from strategy #{@strategy.name}"

      fetch_last_price.tap do |last_price|
        SqlManager.instance.call(PricesSql.insert_price, query_array(last_price))
      end
    end

    private

    def fetch_last_price
      fetch_data = true

      while fetch_data
        result =
          OandaApi.instance.last_avg_price(
            @strategy.instrument_name.upcase, count: 2, granularity: @strategy.granularity_name, smooth: true
          )

        result = JSON.parse(result)['candles'][0]
        fetch_data = fetch_data?(result['time'])
      end

      convert_json_result_to_hash(result)
    end

    def fetch_data?(time)
      if price_exist? time
        Logger.call(
          "Can\'t fetch data for #{@strategy.name}. Will try again in 5 seconds", 'alert'
        )

        puts "--- Waiting 5 sec. for #{@strategy.name}"
        sleep(5)
        true
      else
        false
      end
    end

    def price_exist?(time)
      SqlManager.instance.call(
        PricesSql.count_prices, [@strategy.id, Time.at(time.to_i)]
      )[0]['count'].to_i == 1
    end

    def convert_json_result_to_hash(result)
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

    def query_array(last_price)
      [].tap do |query_array|
        query_array << @strategy.id << last_price.values
        current_time = Time.now
        query_array << current_time << current_time
        query_array.flatten!
      end
    end
  end
end
