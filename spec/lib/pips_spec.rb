# frozen_string_literal: true

require 'rails_helper'
require Rails.root.join('lib', 'pips')

RSpec.describe Forex::Pips do
  it 'returns calculated pips' do
    expect(Forex::Pips.calculate('eur_usd', 0.9345, 0.9378)).to eq 32.999999999999694
  end

  it 'returns calculated pips (usd_jpy)' do
    expect(Forex::Pips.calculate('usd_jpy', 100.73, 100.93)).to eq 20.000000000000284
  end
end
