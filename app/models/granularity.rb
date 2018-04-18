# frozen_string_literal: true

class Granularity < ApplicationRecord
  validates :name, :value, presence: true
  validates :value, numericality: true

  has_many :strategies
end
