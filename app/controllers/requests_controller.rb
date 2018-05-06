# frozen_string_literal: true

class RequestsController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_action :authenticate_user!

  def send_notification
    return unless token_ok? && !notification_params.empty?

    notification_row = render_to_string(
      partial: '/notifications/notification',
      locals: { notification: Notification.find(notification_params[:id]) }
    )

    ActionCable.server.broadcast 'notifications_channel', notification_row: notification_row

    head :no_content
  end

  def show_panel
    session[:show_panel] = params[:state]
  end

  private

  def notification_params
    params.permit(:id)
  end

  def token_ok?
    request.headers['X-AUTH-TOKEN'] == ENV['FOREX_SERVER_TOKEN']
  end
end
