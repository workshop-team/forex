# frozen_string_literal: true

require 'socket'

module ForexServer
  class Settings
    class << self
      def db_connection
        if production_env?
          PG.connect dbname: 'forex', user: 'forex', password: ENV['FOREX_DATABASE_PASSWORD']
        else
          PG.connect dbname: 'forex_development'
        end
      end

      def production_env?
        Socket.gethostname == 'workshop-team'
      end
    end
  end
end
