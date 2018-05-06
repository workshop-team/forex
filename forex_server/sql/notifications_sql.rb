# frozen_string_literal: true

module ForexServer
  class NotificationsSql
    def self.insert_notification
      <<-QUERY
        INSERT INTO notifications (kind, info, created_at, updated_at)
        VALUES($1, $2, $3, $4)
        returning id
      QUERY
    end
  end
end
