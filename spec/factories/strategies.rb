# frozen_string_literal: true

FactoryBot.define do
  factory :strategy do
    name 'My super strategii'
    time_range 20
    instrument
    strategy_logic
  end
end
