# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StrategiesController, type: :controller do
  render_views
  let(:strategy) { create(:strategy) }

  describe 'GET show' do
    it 'renders the show template' do
      get :show, params: { id: strategy }
      expect(response).to render_template('show')
    end
  end

  describe 'GET index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(200)
    end

    it 'populates an array of strategies' do
      strategy = create(:strategy)
      get :index
      expect(assigns(:strategies)).to eq([strategy])
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'GET #new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET #edit' do
    it 'returns http success' do
      get :edit, params: { id: strategy }
      expect(response).to have_http_status(200)
    end
  end
end
