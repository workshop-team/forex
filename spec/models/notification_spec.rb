# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Notification, type: :model do
  it { should validate_presence_of(:type) }
  it { should validate_presence_of(:info) }
end
