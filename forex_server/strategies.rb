# frozen_string_literal: true

require_relative 'strategy'
require_relative 'sql/strategies_sql'
require 'singleton'

module ForexServer
  class Strategies
    include Singleton

    attr_accessor :strategies

    def initialize
      @strategies = []
      init_data
    end

    def add(strategy_id)
      strategy_db_result = SqlManager.instance.call(
        StrategiesSql.strategy_with_id,
        [strategy_id]
      ).first

      @strategies << Strategy.new(strategy_db_result)
    end

    def delete(strategy_id)
      @strategies.reject! { |s| s.id == strategy_id.to_s }
    end

    def call
      @strategies.each { |strategy| Thread.new { strategy.call } }
    end

    def init_data
      results = SqlManager.instance.call(
        StrategiesSql.strategies_with_status_created
      )

      results.each { |result| @strategies << Strategy.new(result) }
    end
  end
end
