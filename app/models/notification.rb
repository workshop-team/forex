# frozen_string_literal: true

class Notification < ApplicationRecord
  validates :kind, :info, presence: true
end
