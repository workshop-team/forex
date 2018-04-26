# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :strategy

  validates :price_buy, :units, presence: true
  validates :price_buy, :units, numericality: true
end
