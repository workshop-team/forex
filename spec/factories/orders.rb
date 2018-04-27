# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    strategy
    price_buy '1.23456'
    price_sell nil
    units 100
  end
end
