# frozen_string_literal: true

Instrument.find_or_create_by(name: 'eur_usd', label: 'EUR/USD')
Instrument.find_or_create_by(name: 'eur_jpy', label: 'EUR/JPY')
Instrument.find_or_create_by(name: 'gbp_usd', label: 'GBP/USD')
Instrument.find_or_create_by(name: 'aud_usd', label: 'AUD/USD')
Instrument.find_or_create_by(name: 'nzd_usd', label: 'NZD/USD')

Granularity.find_or_create_by(name: 'S5', value: 5.second.to_i, label: '5 second candlesticks, minute alignment')
Granularity.find_or_create_by(name: 'S10', value: 10.second.to_i, label: '10 second candlesticks, minute alignment')
Granularity.find_or_create_by(name: 'S15', value: 15.second.to_i, label: '15 second candlesticks, minute alignment')
Granularity.find_or_create_by(name: 'S30', value: 30.second.to_i, label: '30 second candlesticks, minute alignment')

Granularity.find_or_create_by(name: 'M1', value: 1.minute.to_i, label: '1 minute candlesticks, minute alignment')
Granularity.find_or_create_by(name: 'M2', value: 2.minute.to_i, label: '2 minute candlesticks, hour alignment')
Granularity.find_or_create_by(name: 'M4', value: 4.minute.to_i, label: '4 minute candlesticks, hour alignment')
Granularity.find_or_create_by(name: 'M5', value: 5.minute.to_i, label: '5 minute candlesticks, hour alignment')
Granularity.find_or_create_by(name: 'M10', value: 10.minute.to_i, label: '10 minute candlesticks, hour alignment')
Granularity.find_or_create_by(name: 'M15', value: 15.minute.to_i, label: '15 minute candlesticks, hour alignment')
Granularity.find_or_create_by(name: 'M30', value: 30.minute.to_i, label: '30 minute candlesticks, hour alignment')

Granularity.find_or_create_by(name: 'H1', value: 1.hour.to_i, label: '1 hour candlesticks, hour alignment')
Granularity.find_or_create_by(name: 'H2', value: 2.hour.to_i, label: '2 hour candlesticks, day alignment')
Granularity.find_or_create_by(name: 'H3', value: 3.hour.to_i, label: '3 hour candlesticks, day alignment')
Granularity.find_or_create_by(name: 'H4', value: 4.hour.to_i, label: '4 hour candlesticks, day alignment')
Granularity.find_or_create_by(name: 'H6', value: 6.hour.to_i, label: '6 hour candlesticks, day alignment')
Granularity.find_or_create_by(name: 'H8', value: 8.hour.to_i, label: '8 hour candlesticks, day alignment')
Granularity.find_or_create_by(name: 'H12', value: 12.hour.to_i, label: '12 hour candlesticks, day alignment')

Granularity.find_or_create_by(name: 'D', value: 1.day.to_i, label: '1 day candlesticks, day alignment')
Granularity.find_or_create_by(name: 'W', value: 1.week.to_i, label: '1 week candlesticks, aligned to start of week')
Granularity.find_or_create_by(name: 'M', value: 1.month.to_i, label: '1 month candlesticks, aligned to first day of the month')

StrategyLogic.find_or_create_by(class_name: 'StrategyLogic1', label: 'Strategy Logic 1')

puts 'Seeds were added.'
