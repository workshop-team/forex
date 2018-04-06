# frozen_string_literal: true

require 'singleton'
require_relative 'sql/notifications_sql'

module ForexServer
  class Logger
    include Singleton

    URL = 'http://localhost:3000/requests/send_notification'

    def call(info, type = 'info')
      current_time = Time.now

      ForexServer::SqlManager.instance.call(
        ForexServer::NotificationsSql.insert_notification,
        [type, info, current_time, current_time]
      )

      ForexServer::HttpRequester.instance.call('post', URL, info: info, type: type)
    end
  end
end
