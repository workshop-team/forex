# frozen_string_literal: true

FactoryBot.define do
  factory :command do
    name 'add_strategy'
    params { { id: 5 } }
    execute false
  end
end
