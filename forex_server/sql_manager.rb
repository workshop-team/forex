# frozen_string_literal: true

require 'singleton'
require 'pg'

module ForexServer
  class SqlManager
    include Singleton

    def call(query, params = [])
      con = Settings.db_connection
      con.exec_params(query, params)
    rescue PG::Error => e
      Logger.call(e.message, 'error')
      puts e.message
      []
    ensure
      con&.close
    end
  end
end
