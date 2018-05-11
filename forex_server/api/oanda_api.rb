# frozen_string_literal: true

require 'singleton'
require_relative 'http_requester'

module ForexServer
  class OandaApi < HttpRequester
    include Singleton

    URL = 'https://api-fxpractice.oanda.com/v3/'
    HEADERS = {
      'Connection': 'Keep-Alive',
      'Content-Type': 'application/json',
      'Authorization': "Bearer #{ENV['OANDA_TOKEN']}",
      'Accept-Datetime-Format': 'UNIX'
    }.freeze

    def last_price(instrument, params = { count: 1, granularity: 'S5', smooth: true })
      endpoint = "instruments/#{instrument}/candles"
      prepare_call('get', endpoint, params)
    end

    def trade(instrument, units = 1)
      body = {
        order: {
          units: units.to_s,
          instrument: instrument.upcase,
          'timeInForce': 'FOK', 'type': 'MARKET', 'positionFill': 'DEFAULT'
        }
      }.to_json

      endpoint = "accounts/#{ENV['OANDA_ACCOUNT_ID']}/orders"
      prepare_call('post_body', endpoint, body)
    end

    def account_summary
      endpoint = "accounts/#{ENV['OANDA_ACCOUNT_ID']}/summary"
      prepare_call('get', endpoint, nil)
    end

    private

    def prepare_call(method, endpoint, params)
      call(method, "#{URL}#{endpoint}", HEADERS, params)
    end
  end
end
