# frozen_string_literal: true

require_relative 'strategy'
require_relative 'sql/strategies_sql'

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
      results = ForexServer::SqlManager.instance.call(
        ForexServer::StrategiesSql.strategies
      )

      results.each do |result|
        result.transform_keys!(&:to_sym)
        strategy_logic = Object.const_get("ForexServer::#{result[:class_name]}").new
        result[:strategy_logic] = strategy_logic

        strategy = ForexServer::Strategy.new(result)

        @strategies << strategy
      end
    end
  end
end
