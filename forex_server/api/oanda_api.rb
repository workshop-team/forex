# frozen_string_literal: true

require 'singleton'
require_relative 'http_requester'

module ForexServer
  class OandaApi < HttpRequester
    include Singleton

    URL = 'https://api-fxpractice.oanda.com/v3/'
    HEADERS = {
      'Content-Type': 'application/json',
      'Authorization': "Bearer #{ENV['OANDA_TOKEN']}",
      'Accept-Datetime-Format': 'UNIX'
    }.freeze

    def last_price(instrument, params = { count: 1, granularity: 'S5', smooth: true })
      endpoint = "instruments/#{instrument}/candles"
      prepare_call('get', endpoint, params)
    end

    private

    def prepare_call(method, endpoint, params)
      call(method, "#{URL}#{endpoint}", HEADERS, params)
    end
  end
end
