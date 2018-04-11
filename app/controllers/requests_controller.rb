# frozen_string_literal: true

class RequestsController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_action :authenticate_user!

  def send_notification
    return unless token_ok?(params[:token])

    if info_and_kind?
      notification_row = render_to_string(
        partial: '/notifications/notification',
        locals: { notification: Notification.new(info: notification_params[:info], kind: notification_params[:kind]) }
      )

      ActionCable.server.broadcast 'notifications_channel', notification_row: notification_row
    end

    head :no_content
  end

  private

  def notification_params
    params.permit(:info, :kind, :token)
  end

  def token_ok?(token)
    # TODO: add token to secrets
    token == '123456789'
  end

  def info_and_kind?
    notification_params[:info].present? && notification_params[:kind].present?
  end
end
