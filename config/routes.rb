# frozen_string_literal: true

Rails.application.routes.draw do
  resources :strategies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'strategies#index'
  get 'home' => 'pages#home'
end
