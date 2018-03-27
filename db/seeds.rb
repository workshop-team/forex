# frozen_string_literal: true

Instrument.destroy_all
Instrument.create(name: 'eur_usd', label: 'EUR/USD')
Instrument.create(name: 'eur_jpy', label: 'EUR/JPY')
Instrument.create(name: 'gbp_usd', label: 'GBP/USD')
Instrument.create(name: 'aud_usd', label: 'AUD/USD')
Instrument.create(name: 'nzd_usd', label: 'NZD/USD')
