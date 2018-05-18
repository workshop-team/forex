# frozen_string_literal: true

Rails.application.routes.draw do
  root 'strategies#index'
  resources :strategies do
    member do
      get 'change_status/:status', action: 'change_status', as: :change_status
    end

    get 'page/:page', action: :show, on: :member
  end

  resources :users, only: %i[index edit update]

  post 'requests/send_notification'
  post 'requests/show_panel'
  get 'requests/chart_data/:strategy_id', to: 'requests#chart_data'
  get 'requests/last_chart_data/:strategy_id', to: 'requests#last_chart_data'

  get 'home' => 'pages#home'

  devise_for :users
end
