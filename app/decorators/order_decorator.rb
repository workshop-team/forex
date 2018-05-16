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
    object.price_sell.present? ? h.coloraize_number((object.price_sell - object.price_buy) * 10_000) : 0
  end
end
