# frozen_string_literal: true

class Strategy < ApplicationRecord
  has_many :prices, dependent: :destroy
  has_one :order
  belongs_to :instrument
  belongs_to :strategy_logic
  belongs_to :granularity

  validates :name, :status, presence: true
  validates :units, numericality: { allow_nil: true }

  enum status: { created: 0, active: 1, finished: 2 }
end
