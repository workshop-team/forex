# frozen_string_literal: true

class Instrument < ApplicationRecord
  validates :name, :label, presence: true
end
