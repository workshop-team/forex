# frozen_string_literal: true

class Price < ApplicationRecord
  validates :open, :high, :low, :close, :volume, :time, presence: true
  validates :open, :high, :low, :close, numericality: true

  belongs_to :strategy
end
