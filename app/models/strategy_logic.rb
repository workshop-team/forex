# frozen_string_literal: true

class StrategyLogic < ApplicationRecord
  validates :class_name, :label, presence: true
end
