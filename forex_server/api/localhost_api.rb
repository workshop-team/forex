# frozen_string_literal: true

require_relative 'http_requester'
require 'singleton'

module ForexServer
  class LocalhostApi < HttpRequester
    include Singleton

    URL = "http://#{ForexServer::Settings.domain}/requests/"
    HEADERS = { 'X-AUTH-TOKEN': ENV['FOREX_SERVER_TOKEN'], 'Connection': 'Keep-Alive' }.freeze

    def send_notification(params)
      prepare_call('post', 'send_notification', params)
    end

    private

    def prepare_call(method, endpoint, params)
      call(method, "#{URL}#{endpoint}", HEADERS, params)
    end
  end
end
