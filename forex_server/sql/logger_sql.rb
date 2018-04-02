# frozen_string_literal: true

module ForexServer
  class LoggerSql
    def self.insert_notification
      <<-QUERY
        INSERT INTO notifications (type, info, created_at, updated_at)
        VALUES($1, $2, $3, $4)
      QUERY
    end
  end
end
