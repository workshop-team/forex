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
      return unless find(strategy_id).nil?

      strategy_db_result = SqlManager.instance.call(
        StrategiesSql.strategy_with_id,
        [strategy_id]
      ).first

      @strategies << Strategy.new(strategy_db_result)
      Logger.call("Strategy >>> #{strategy_db_result[:strategy_name]} <<< added successfully")
    end

    def delete(strategy_hash)
      return if find(strategy_hash['id']).nil?

      @strategies.reject! { |s| s.id == strategy_hash['id'].to_s }
      Logger.call("Strategy >>> #{strategy_hash['name']} <<< deleted successfully", 'alert')
    end

    def find(strategy_id)
      @strategies.find { |s| s.id == strategy_id.to_s }
    end

    def call
      @strategies.each { |strategy| Thread.new { strategy.call } }
    end

    def init_data
      results = SqlManager.instance.call(
        StrategiesSql.strategies_with_status_active
      )

      results.each { |result| @strategies << Strategy.new(result) }
    end
  end
end
