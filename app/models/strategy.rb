# frozen_string_literal: true

class Strategy < ApplicationRecord
  has_many :prices, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_one :strategy_logic_provider, dependent: :destroy
  belongs_to :instrument
  belongs_to :strategy_logic
  belongs_to :granularity

  validates :name, :status, presence: true
  validates :units, :stop_loss, :take_profit, numericality: { allow_nil: true }

  enum status: { created: 0, activated: 1, stopped: 2 }
end
