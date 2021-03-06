# frozen_string_literal: true

module ForexServer
  class InitTimer
    WAIT = 10 # Time in seconds. Allows Oanda generate the newest data.

    def self.call(strategy)
      result =
        ForexServer::OandaApi.instance.last_avg_price(
          strategy.instrument_name, count: 1, granularity: strategy.granularity_name
        )

      result = JSON.parse(result)
      result['candles'][0]['time'].to_i + strategy.granularity_value.to_i + WAIT
    end
  end
end
