# frozen_string_literal: true

Rails.application.routes.draw do
  root 'strategies#index'
  resources :strategies

  post 'requests/send_notification'
  get 'home' => 'pages#home'
end
