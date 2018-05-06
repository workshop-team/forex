# frozen_string_literal: true

require 'singleton'
require_relative 'sql/notifications_sql'

module ForexServer
  class Logger
    include Singleton

    def call(info, kind = 'info')
      current_time = Time.now

      result = SqlManager.instance.call(
        NotificationsSql.insert_notification,
        [kind, info, current_time, current_time]
      )

      LocalhostApi.instance.send_notification(id: result[0]['id'])
    end
  end
end
