# frozen_string_literal: true

module ForexServer
  class BeginnerTimer
    def self.call(strategy)
      result =
        ForexServer::OandaApi.instance.last_price(
          strategy.instrument_name.upcase, count: 1, granularity: strategy.granularity_name
        )

      result = JSON.parse(result)
      result['candles'][0]['time'].to_i + strategy.granularity_value.to_i
    end
  end
end
