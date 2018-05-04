# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Strategy, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:status) }
  it { should validate_numericality_of(:units) }

  it { should have_many(:prices) }
  it { should have_many(:orders) }
  it { should have_one(:strategy_logic_provider) }
  it { should belong_to(:strategy_logic) }
  it { should belong_to(:instrument) }
  it { should belong_to(:granularity) }
end
