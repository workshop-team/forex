# frozen_string_literal: true

class Command < ApplicationRecord
  validates :name, presence: true
end
