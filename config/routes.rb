# frozen_string_literal: true

Rails.application.routes.draw do
  root 'strategies#index'

  resources :strategies do
    member do
      get 'change_status/:status', action: 'change_status', as: :change_status
    end

    get 'page/:page', action: :show, on: :member
  end

  post 'requests/send_notification'
  post 'requests/show_panel'
  get 'requests/chart_data/:strategy_id', to: 'requests#chart_data'
  get 'requests/last_chart_data/:strategy_id', to: 'requests#last_chart_data'

  resources :users, only: %i[index edit update]

  concern :paginatable do
    get '(page/:page)', action: :index, on: :collection, as: ''
  end

  resources :commands, only: :index, concerns: :paginatable

  get 'home' => 'pages#home'

  devise_for :users
end
