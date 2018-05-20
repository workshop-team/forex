# frozen_string_literal: true

class OrderDecorator < Draper::Decorator
  delegate_all

  def self.collection_decorator_class
    PaginatingDecorator
  end

  def pl
    h.coloraize_number(object.pl.round(2)) if object.pl.present?
  end

  def status
    object.status == 'active' ? h.content_tag(:span, object.status, class: 'text-success') : object.status
  end

  def pips
    object.price_sell.present? ? h.coloraize_number((object.price_sell - object.price_buy) * pip_size) : 0
  end

  private

  def instrument
    object.strategy.instrument.name
  end

  def pip_size
    instrument == 'usd_jpy' ? 100 : 10_000
  end
end
