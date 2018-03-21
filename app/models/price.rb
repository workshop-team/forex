# frozen_string_literal: true

class Price < ApplicationRecord
  validates :instrument, :ask, :bid, :time, presence: true
  validates :ask, :bid, numericality: true

  enum instrument: { eur_usd: 0, nzd_usd: 1 }
end
