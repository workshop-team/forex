# frozen_string_literal: true

require_relative 'strategy'

module ForexServer
  class Strategies
    def initialize
      @strategies = []
      init_data
    end

    def add(strategy)
      @strategies << strategy
    end

    def list
      @strategies
    end

    def call
      @strategies.each(&:call)
    end

    def init_data
      # this data will be fetched from the database
      sl1 = Object.const_get('ForexServer::StrategyLogic1').new

      s1 = ForexServer::Strategy.new(id: 1, name: 'Strategia 1', time_range: 20, instrument: 'eur_usd', sl: sl1)
      s2 = ForexServer::Strategy.new(id: 2, name: 'Strategia 2', time_range: 5, instrument: 'usd_eur', sl: sl1)
      s3 = ForexServer::Strategy.new(id: 3, name: 'Strategia 3', time_range: 15, instrument: 'eur_pl', sl: sl1)

      @strategies << s1
      @strategies << s2
      @strategies << s3
    end
  end
end
