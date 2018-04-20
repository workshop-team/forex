# frozen_string_literal: true

require 'singleton'
require 'pg'

module ForexServer
  class SqlManager
    include Singleton

    def call(query, params = [])
      # TODO: Setting credintals in .env and build a logic for using develop/production db
      con = PG.connect dbname: 'forex_development' # , user: 'user_sample', password: 'pswd_sample'
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
