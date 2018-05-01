# frozen_string_literal: true

module ForexServer
  class Units
    class << self
      def value(strategy)
        strategy.units.nil? ? calculate : strategy.units
      end

      def calculate
        # TODO: set 5% of your capital if field 'units' is nil
        100
      end
    end
  end
end
