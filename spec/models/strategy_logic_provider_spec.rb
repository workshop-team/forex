# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StrategyLogicProvider, type: :model do
  it { should belong_to(:strategy) }
end
