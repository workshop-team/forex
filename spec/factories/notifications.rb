# frozen_string_literal: true

FactoryBot.define do
  factory :notification do
    type 'error'
    info 'Help, we are in trouble!'
  end
end
