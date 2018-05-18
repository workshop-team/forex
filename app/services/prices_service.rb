# frozen_string_literal: true

class PricesService
  def self.format_chart_data(record)
    record = record.decorate
    [record.time, record.open, record.high, record.low, record.close]
  end
end
