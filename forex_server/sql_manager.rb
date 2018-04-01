# frozen_string_literal: true

require 'singleton'
require 'pg'

module ForexServer
  class SqlManager
    include Singleton

    def initialize
      @con = PG.connect dbname: 'forex_development' # , user: 'user_sample', password: 'pswd_sample'
    end

    def call(query, params = [])
      @con.exec_params(query, params)
    rescue PG::Error => e
      ForexServer::Logger.instance.call(e.message, 'error')
      puts e.message
      []
    end
  end
end
