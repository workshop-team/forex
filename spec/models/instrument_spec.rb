# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Instrument, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:label) }
  it { should have_many(:strategies) }
end
