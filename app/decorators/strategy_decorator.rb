# frozen_string_literal: true

class StrategyDecorator < Draper::Decorator
  delegate_all

  def units
    object.units.nil? ? I18n.t('auto') : object.units
  end

  def manager
    h.content_tag(:a, manager_label, href: h.change_status_strategy_path(id: object.id, status: object.status))
  end

  def status_label
    clazz = object.status == 'activated' ? 'text-success' : 'text-warning'
    h.content_tag :span, object.status, class: clazz
  end

  private

  def manager_label
    case object.status
    when 'created'
      'Start'
    when 'activated'
      'Stop'
    when 'stopped'
      'Restart'
    end
  end
end
