# frozen_string_literal: true

class Instrument < ApplicationRecord
  has_many :strategies

  validates :name, :label, presence: true
end
