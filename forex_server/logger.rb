# frozen_string_literal: true

require 'singleton'
require_relative 'sql/logger_sql'

module ForexServer
  class Logger
    include Singleton

    URL = 'http://localhost:3000/requests/send_notification'

    def call(info, type = 'info')
      ForexServer::SqlManager.instance.call(
        ForexServer::LoggerSql.insert_notification,
        [type, info, Time.now, Time.now]
      )

      ForexServer::HttpRequester.instance.call('post', URL, info: info, type: type)
    end
  end
end
