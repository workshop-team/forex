# frozen_string_literal: true

module ForexServer
  class Candel
    class << self
      def red?(last_price)
        last_price[:open] >= last_price[:close]
      end

      def green?(last_price)
        last_price[:open] < last_price[:close]
      end
    end
  end
end
