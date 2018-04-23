# frozen_string_literal: true

require 'singleton'
require 'pg'
require_relative 'database'

module ForexServer
  class SqlManager
    include Singleton

    def call(query, params = [])
      con = ForexServer::Database.connection
      con.exec_params(query, params)
    rescue PG::Error => e
      ForexServer::Logger.instance.call(e.message, 'error')
      puts e.message
      []
    ensure
      con&.close
    end
  end
end
