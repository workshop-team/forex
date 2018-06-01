# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OrderDecorator, type: :decorator do
  let(:order) { build_stubbed(:order) }

  it 'returns formated P/L (positive value)' do
    order.pl = 25.678989
    expect(order.decorate.pl).to eq '<span class="text-success">25.68</span>'
  end

  it 'returns formated P/L (negative value)' do
    order.pl = -15.678989
    expect(order.decorate.pl).to eq '<span class="text-danger">-15.68</span>'
  end

  it 'returnd status' do
    expect(order.decorate.status).to eq '<span class="text-success">active</span>'
  end

  it 'returnd status' do
    order.status = 'finished'
    expect(order.decorate.status).to eq 'finished'
  end

  it 'returns pips (active state)' do
    expect(order.decorate.pips).to eq 0
  end

  it 'return pips (finished state)' do
    order.price_buy = 0.6789
    order.price_sell = 0.6799
    expect(order.decorate.pips).to eq '<span class="text-success">10.0</span>'
  end
end
