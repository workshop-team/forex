# frozen_string_literal: true

class RequestsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def send_notification
    return unless token_ok?(params[:token])

    notification_params = params.require(:request).permit(:info, :type, :token)

    info = notification_params[:info]
    type = notification_params[:type]

    ActionCable.server.broadcast 'notifications_channel', info: info, type: type if info.present? && type.present?

    head :no_content
  end

  private

  def token_ok?(token)
    # TODO: add token to secrets
    token == '123456789'
  end
end
