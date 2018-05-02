# frozen_string_literal: true

class ApplicationController < ActionController::Base
  layout :layout_by_resources

  before_action :authenticate_user!
  before_action :note
  before_action :show_panel

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html' }
      format.html { redirect_to home_url, notice: exception.message }
      format.js   { head :forbidden, content_type: 'text/html' }
    end
  end

  private

  def note
    @notifications = Notification.order(created_at: :desc).limit(20)
  end

  def layout_by_resources
    devise_controller? ? 'devise' : 'application'
  end

  def show_panel
    @show_panel_class = session[:show_panel] == 'false' ? 'sidebar-collapse' : ''
  end
end
