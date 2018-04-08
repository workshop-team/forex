# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :note
  def note
    @notifications = Notification.last(20)
  end
end
