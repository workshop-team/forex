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

  def stop_loss
    stop_trade(object.stop_loss)
  end

  def take_profit
    stop_trade(object.take_profit)
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

  def stop_trade(action)
    action.present? ? action : h.content_tag(:span, h.t('not_set'), class: 'text-warning')
  end
end
