# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Strategy, type: :model do
  it { should validate_presence_of(:name) }

  it { should have_many(:prices) }
  it { should have_one(:order) }
  it { should belong_to(:strategy_logic) }
  it { should belong_to(:instrument) }
  it { should belong_to(:granularity) }
end
