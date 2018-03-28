# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Strategy, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:time_range) }
  it { should validate_numericality_of(:time_range) }
  it { should belong_to(:strategy_logic) }
  it { should belong_to(:instrument) }
end
