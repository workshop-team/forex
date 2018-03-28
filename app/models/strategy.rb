# frozen_string_literal: true

class Strategy < ApplicationRecord
  belongs_to :instrument
  belongs_to :strategy_logic

  validates :name, :time_range, presence: true
  validates :time_range, numericality: true
end
