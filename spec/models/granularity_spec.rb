# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Granularity, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:value) }
  it { should validate_numericality_of(:value) }
  it { should have_many(:strategies) }
end
