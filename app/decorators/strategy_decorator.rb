# frozen_string_literal: true

class StrategyDecorator < Draper::Decorator
  delegate_all

  def units
    object.units.nil? ? I18n.t('auto') : object.units
  end
end
