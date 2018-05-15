# frozen_string_literal: true

class StrategiesService
  def self.change_status(status)
    case status
    when 'created', 'stopped'
      'activated'
    when 'activated'
      'stopped'
    end
  end
end
