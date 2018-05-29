# frozen_string_literal: true

require Rails.root.join('lib', 'pips')

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
    return 0 unless object.price_sell.present?

    h.coloraize_number(
      Forex::Pips.calculate(object.strategy.instrument.name, object.price_buy, object.price_sell)
    )
  end

  private

  def instrument
    object.strategy.instrument.name
  end
end
