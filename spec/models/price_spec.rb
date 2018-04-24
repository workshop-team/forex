# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Price, type: :model do
  it { should belong_to(:strategy) }

  it { should validate_presence_of(:open) }
  it { should validate_presence_of(:high) }
  it { should validate_presence_of(:low) }
  it { should validate_presence_of(:close) }
  it { should validate_presence_of(:volume) }
  it { should validate_presence_of(:time) }

  it { should validate_numericality_of(:open) }
  it { should validate_numericality_of(:high) }
  it { should validate_numericality_of(:low) }
  it { should validate_numericality_of(:close) }
end
