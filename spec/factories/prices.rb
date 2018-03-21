# frozen_string_literal: true

FactoryBot.define do
  factory :price do
    instrument 'eur_usd'
    ask '1.13032'
    bid '1.13011'
    time '2016-06-22 18:41:36'
  end
end
