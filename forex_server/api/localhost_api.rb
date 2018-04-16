# frozen_string_literal: true

require_relative 'http_requester'
require 'singleton'

module ForexServer
  class LocalhostApi < HttpRequester
    include Singleton

    URL = 'http://localhost:3000/requests/'
    # TODO: fetch token from Rails app
    TOKEN = '123456789'

    def send_notification(params)
      prepare_call('post', 'send_notification', params)
    end

    private

    def prepare_call(method, endpoint, params)
      call(method, "#{URL}#{endpoint}", nil, params.merge(token: TOKEN))
    end
  end
end
