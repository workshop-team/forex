# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Order, type: :model do
  it { should validate_presence_of(:price_buy) }
  it { should validate_presence_of(:time_buy) }
  it { should validate_presence_of(:oanda_buy_order_id) }
  it { should validate_presence_of(:units) }
  it { should validate_numericality_of(:price_buy) }
  it { should validate_numericality_of(:oanda_buy_order_id) }
  it { should validate_numericality_of(:units) }

  it { should belong_to(:strategy) }
end
