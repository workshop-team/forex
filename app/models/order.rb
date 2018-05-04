# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :strategy

  validates :price_buy, :time_buy, :units, :oanda_buy_order_id, presence: true
  validates :price_buy, :units, :oanda_buy_order_id, numericality: true

  enum status: { active: 0, finished: 1 }
end
