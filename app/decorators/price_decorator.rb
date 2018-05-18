# frozen_string_literal: true

class PriceDecorator < Draper::Decorator
  delegate_all

  def time
    object.time.to_i * 1000
  end

  def open
    object.open.to_f
  end

  def high
    object.high.to_f
  end

  def low
    object.low.to_f
  end

  def close
    object.close.to_f
  end
end
