# frozen_string_literal: true

module ForexServer
  class Strategy
    attr_reader :id, :name, :time_range, :instrument, :last_time, :strategy_logic, :class_name

    def initialize(db_result)
      db_result.transform_keys!(&:to_sym)

      @id = db_result.fetch(:id, nil)
      @name = db_result.fetch(:strategy_name, nil)
      @time_range = db_result.fetch(:time_range, nil).to_i
      @instrument = db_result.fetch(:instrument_name, nil)
      @strategy_logic = Object.const_get("ForexServer::#{db_result[:class_name]}").new
      @class_name = db_result.fetch(:class_name, nil)
      @last_time = Time.now
    end

    def call
      return unless refresh_strategy? && valid?
      @last_time = Time.now

      puts "-- Call strategy: #{@name}"
      @strategy_logic.call(self)
    end

    def refresh_strategy?
      @last_time + @time_range <= Time.now
    end

    def valid?
      !@id.nil? && !@name.nil? && !@time_range.nil? && !@instrument.nil? && !@strategy_logic.nil?
    end
  end
end
