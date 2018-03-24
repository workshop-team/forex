# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  render_views

  describe 'GET home' do
    it 'returns http success' do
      get :home
      expect(response).to have_http_status(200)
    end
  end
end
