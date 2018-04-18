# frozen_string_literal: true

FactoryBot.define do
  factory :granularity do
    name 'S10'
    value 10
    label '10 second candlesticks, minute alignment'
  end
end
