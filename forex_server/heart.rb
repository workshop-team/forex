# frozen_string_literal: true

module ForexServer
  class Heart
    def initialize(period)
      loop do
        before = Time.now
        interval = period - (Time.now - before)

        sleep(interval) if interval.positive?
        puts "\n"
        puts "- Heartbeat #{Time.now.strftime('%X')}"
        yield
      end
    end
  end
end
