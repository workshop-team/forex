# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  it "returns 'alert-danger' when 'error'" do
    expect(bootstrap_class_for('error')).to eq 'alert-danger'
  end

  it "returns 'alert-success' when 'success'" do
    expect(bootstrap_class_for('success')).to eq 'alert-success'
  end

  it "returns 'alert-waring' when 'alert'" do
    expect(bootstrap_class_for('alert')).to eq 'alert-warning'
  end

  it "returns 'alert-info' when 'notice'" do
    expect(bootstrap_class_for('notice')).to eq 'alert-info'
  end

  it "returns 'alert-info' when 'not-known-value'" do
    expect(bootstrap_class_for('not-known-value')).to eq 'alert-info'
  end

  it 'returns positive colloraized number' do
    expect(coloraize_number(100.34)).to eq('<span class="text-success">100.34</span>')
  end

  it 'returns negative colloraized number' do
    expect(coloraize_number(-100.34)).to eq('<span class="text-danger">-100.34</span>')
  end
end
