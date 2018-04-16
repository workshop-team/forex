# frozen_string_literal: true

require_relative 'http_requester'
require 'singleton'

module ForexServer
  class LocalhostApi < HttpRequester
    include Singleton

    URL = 'http://localhost:3000/requests/'
    HEADERS = { 'X-AUTH-TOKEN': ENV['FOREX_SERVER_TOKEN'] }.freeze

    def send_notification(params)
      prepare_call('post', 'send_notification', params)
    end

    private

    def prepare_call(method, endpoint, params)
      call(method, "#{URL}#{endpoint}", HEADERS, params)
    end
  end
end
