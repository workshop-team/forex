# frozen_string_literal: true

require 'singleton'
require_relative 'sql/logger_sql'

module ForexServer
  class Logger
    include Singleton

    def save(info, type = 'info')
      ForexServer::SqlManager.instance.call(
        ForexServer::LoggerSql.insert_notification,
        [type, info, Time.now, Time.now]
      )
    end
  end
end
