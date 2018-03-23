# frozen_string_literal: true

module ForexServer
  class Manager
    def initialize(strategies)
      @strategies = strategies
    end

    def call
      # fetch from database commands like add/remove strategy, sell/buy instrument
      puts '-- Manage trading'
    end
  end
end
