# frozen_string_literal: true

class ApplicationController < ActionController::Base
  layout :layout_by_resources

  before_action :authenticate_user!
  before_action :note

  private

  def note
    @notifications = Notification.order(created_at: :desc).limit(20)
  end

  def layout_by_resources
    devise_controller? ? 'devise' : 'application'
  end
end
