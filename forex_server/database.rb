# frozen_string_literal: true

require 'socket'

module ForexServer
  class Database
    class << self
      def connection
        if Socket.gethostname == 'workshop-team'
          PG.connect dbname: 'forex', user: 'forex', password: ENV['FOREX_DATABASE_PASSWORD']
        else
          PG.connect dbname: 'forex_development'
        end
      end
    end
  end
end
