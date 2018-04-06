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
      strategy_db_result = ForexServer::SqlManager.instance.call(
        ForexServer::StrategiesSql.strategy_with_id,
        [strategy_id]
      ).first

      strategy = build_strategy_object(strategy_db_result)

      @strategies << strategy
    end

    def delete(strategy_id)
      @strategies.reject! { |s| s.id == strategy_id.to_s }
    end

    def call
      @strategies.each(&:call)
    end

    def init_data
      results = ForexServer::SqlManager.instance.call(
        ForexServer::StrategiesSql.strategies
      )

      results.each { |result| @strategies << build_strategy_object(result) }
    end

    def build_strategy_object(result)
      result.transform_keys!(&:to_sym)
      strategy_logic = Object.const_get("ForexServer::#{result[:class_name]}").new
      result[:strategy_logic] = strategy_logic

      ForexServer::Strategy.new(result)
    end
  end
end
