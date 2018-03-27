# frozen_string_literal: true

Instrument.find_or_create_by(name: 'eur_usd', label: 'EUR/USD')
Instrument.find_or_create_by(name: 'eur_jpy', label: 'EUR/JPY')
Instrument.find_or_create_by(name: 'gbp_usd', label: 'GBP/USD')
Instrument.find_or_create_by(name: 'aud_usd', label: 'AUD/USD')
Instrument.find_or_create_by(name: 'nzd_usd', label: 'NZD/USD')

puts 'Seeds were added.'
