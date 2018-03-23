# frozen_string_literal: true

module ForexServer
  class Strategy
    attr_reader :id, :name, :time_range, :instrument, :last_time, :sl

    def initialize(options = {})
      @id = options.fetch(:id, nil)
      @name = options.fetch(:name, nil)
      @time_range = options.fetch(:time_range, nil)
      @instrument = options.fetch(:instrument, nil)
      @sl = options.fetch(:sl, nil)
      @last_time = Time.now
    end

    def call
      return unless refresh_strategy?
      @last_time = Time.now

      puts "-- Call strategy: #{@name}"
      @sl.call(self)
    end

    def refresh_strategy?
      @last_time + @time_range <= Time.now
    end
  end
end
