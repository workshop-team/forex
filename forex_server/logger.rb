# frozen_string_literal: true

require 'singleton'
require_relative 'sql/notifications_sql'

module ForexServer
  class Logger
    include Singleton

    def call(info, kind = 'info')
      current_time = Time.now

      ForexServer::SqlManager.instance.call(
        ForexServer::NotificationsSql.insert_notification,
        [kind, info, current_time, current_time]
      )

      ForexServer::LocalhostApi.instance.send_notification(info: info, kind: kind)
    end
  end
end
