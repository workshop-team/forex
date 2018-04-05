# frozen_string_literal: true

module ForexServer
  class CommandsSql
    class << self
      def commands
        <<-QUERY
          SELECT * FROM commands WHERE execute = false
        QUERY
      end

      def update_execute
        <<-QUERY
          UPDATE commands SET execute = true WHERE id = $1
        QUERY
      end
    end
  end
end
