# frozen_string_literal: true

FactoryBot.define do
  factory :strategy do
    name 'My super strategii'
    instrument
    strategy_logic
    granularity
    units 100
    stop_loss nil
    take_profit nil
    status 0
  end
end
