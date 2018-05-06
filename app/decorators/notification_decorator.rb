# frozen_string_literal: true

class NotificationDecorator < Draper::Decorator
  delegate_all

  def text
    "[#{I18n.l(object.created_at, format: :long)}] #{object.info}"
  end
end
