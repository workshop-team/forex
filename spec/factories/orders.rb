# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    strategy
    price_buy '1.23456'
    time_buy Time.now
    oanda_buy_order_id 123
    price_sell nil
    time_sell nil
    oanda_sell_order_id nil
    units 100
  end
end
