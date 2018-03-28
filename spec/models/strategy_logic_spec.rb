# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StrategyLogic, type: :model do
  it { should validate_presence_of(:class_name) }
  it { should validate_presence_of(:label) }
  it { should have_many(:strategies) }
end
