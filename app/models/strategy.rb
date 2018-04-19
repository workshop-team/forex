# frozen_string_literal: true

class Strategy < ApplicationRecord
  belongs_to :instrument
  belongs_to :strategy_logic
  belongs_to :granularity

  validates :name, presence: true
end
