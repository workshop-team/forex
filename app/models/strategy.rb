# frozen_string_literal: true

class Strategy < ApplicationRecord
  has_many :prices, dependent: :destroy
  has_one :order
  belongs_to :instrument
  belongs_to :strategy_logic
  belongs_to :granularity

  validates :name, presence: true
end
