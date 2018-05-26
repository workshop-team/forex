# frozen_string_literal: true

require_relative 'init_timer'
require_relative 'strategy_logic/strategy_logic1'
require_relative 'strategy_logic/three_down_one_up'
require_relative 'strategy_logic/two_up'
require_relative 'stop_trader'

module ForexServer
  class Strategy
    attr_reader(
      :id, :name, :granularity_value, :instrument_name,
      :strategy_logic, :class_name, :granularity_name, :units,
      :stop_loss, :take_profit,
      :last_time
    )

    def initialize(db_result)
      define_fields(db_result)

      @last_time = Time.at(InitTimer.call(self))
    end

    def call
      @order = Order.active_strategy(self)

      return unless valid? && !stop_trading? && execute_strategy?
      @last_time += granularity_value

      puts "-- Call strategy: #{@name}"
      @strategy_logic.call(@order)
    end

    private

    def define_fields(db_result)
      db_result.transform_keys!(&:to_sym)

      @id = db_result.fetch(:id, nil)
      @name = db_result.fetch(:strategy_name, nil)
      @granularity_value = db_result.fetch(:value, nil).to_i
      @granularity_name = db_result.fetch(:granularity_name, nil)
      @instrument_name = db_result.fetch(:instrument_name, nil)
      @units = db_result.fetch(:units, nil)
      define_fields_strategy_logic(db_result)
      define_fields_stop_trade(db_result)
    end

    def define_fields_strategy_logic(db_result)
      @strategy_logic = Object.const_get("ForexServer::#{db_result[:class_name]}").new(self)
      @class_name = db_result.fetch(:class_name, nil)
    end

    def define_fields_stop_trade(db_result)
      @stop_loss = db_result.fetch(:stop_loss)
      @take_profit = db_result.fetch(:take_profit)
    end

    def execute_strategy?
      @last_time <= Time.now
    end

    def valid?
      !@id.nil? && !@name.nil? && !@granularity_value.nil? && !@instrument_name.nil? && !@strategy_logic.nil?
    end

    def stop_trading?
      @order.count == 1 ? StopTrader.instance.call(self, @order) : false
    end
  end
end
