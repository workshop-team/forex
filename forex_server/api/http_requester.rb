# frozen_string_literal: true

require 'http'

module ForexServer
  class HttpRequester
    def call(method, url, headers = nil, params = nil)
      send method, url, headers, params
    end

    def get(url, headers, params)
      handle_error { HTTP.headers(headers).get(url, params: params) }
    end

    def post(url, headers, params)
      handle_error { HTTP.headers(headers).post(url, params: params) }
    end

    def post_body(url, headers, body)
      handle_error { HTTP.headers(headers).post(url, body: body) }
    end

    def handle_error
      yield
    rescue HTTP::ConnectionError => e
      puts "FS: #{e.message}"
    end
  end
end
