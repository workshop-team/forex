# frozen_string_literal: true

require 'singleton'
require 'http'

module ForexServer
  class HttpRequester
    include Singleton

    # TODO: fetch token from Rails app
    TOKEN = '123456789'

    def call(method, url, params = nil)
      send method, url, params.merge(token: TOKEN)
    end

    def get(url, params)
      HTTP.get(url, params: params)
    end

    def post(url, params)
      HTTP.post(url, params: params)
    end
  end
end
