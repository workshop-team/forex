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
    pl nil
    half_spread_cost nil
    units 100
    status 0
  end
end
