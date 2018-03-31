# frozen_string_literal: true

Rails.application.routes.draw do
  root 'pages#home'

  post 'requests/send_notification'
end
