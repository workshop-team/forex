# frozen_string_literal: true

Rails.application.routes.draw do
  root 'strategies#index'
  resources :strategies
  resources :users, only: %i[index edit update]

  post 'requests/send_notification'
  get 'home' => 'pages#home'

  devise_for :users
end
