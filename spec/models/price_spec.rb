# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Price, type: :model do
  it { should validate_presence_of(:instrument) }
  it { should validate_presence_of(:ask) }
  it { should validate_presence_of(:bid) }
  it { should validate_presence_of(:time) }
  it { should validate_numericality_of(:ask) }
  it { should validate_numericality_of(:bid) }
end
