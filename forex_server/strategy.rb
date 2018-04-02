# frozen_string_literal: true

module ForexServer
  class Strategy
    attr_reader :id, :name, :time_range, :instrument, :last_time, :strategy_logic

    def initialize(options = {})
      @id = options.fetch(:id, nil)
      @name = options.fetch(:strategy_name, nil)
      @time_range = options.fetch(:time_range, nil).to_i
      @instrument = options.fetch(:instrument_name, nil)
      @strategy_logic = options.fetch(:strategy_logic, nil)
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
