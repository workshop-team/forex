# frozen_string_literal: true

require 'rails_helper'
require Rails.root.join('forex_server/strategy')
require Rails.root.join('forex_server/strategy_logic/strategy_logic1')

describe ForexServer::Strategy do
  let!(:sl1) { ForexServer::StrategyLogic1.new }
  let(:strategy1) do
    ForexServer::Strategy.new(
      id: 1, strategy_name: 'Strategia 1', time_range: 2, instrument_name: 'eur_usd', strategy_logic: sl1
    )
  end

  let(:strategy2) do
    ForexServer::Strategy.new(
      id: 1, strategy_name: 'Strategia 1', time_range: 5, instrument_name: nil, strategy_logic: sl1
    )
  end

  it 'returns true if object is valid' do
    expect(strategy1.valid?).to eq(true)
  end

  it 'return false if object is invalid' do
    expect(strategy2.valid?).to eq(false)
  end
end
