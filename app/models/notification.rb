# frozen_string_literal: true

class Notification < ApplicationRecord
  validates :type, :info, presence: true
end
