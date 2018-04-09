# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :note

  def note
    @notifications = Notification.order(created_at: :desc).limit(20)
  end
end
