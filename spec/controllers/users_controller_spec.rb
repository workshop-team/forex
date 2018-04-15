# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  render_views
  let(:user) { create(:user) }
  let(:guest_user) { create(:user, email: 'testus@test.pl', role: 'guest') }

  before { sign_in user }

  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET #edit' do
    it 'returns http success' do
      get :edit, params: { id: guest_user.id }
      expect(response).to have_http_status(200)
    end
  end
end
