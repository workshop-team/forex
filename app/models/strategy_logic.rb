# frozen_string_literal: true

class StrategyLogic < ApplicationRecord
  has_many :strategies

  validates :class_name, :label, presence: true
end
