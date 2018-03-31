# frozen_string_literal: true

Rails.application.routes.draw do
  root 'strategies#index'
  resources :strategies
  get 'home' => 'pages#home'
end
