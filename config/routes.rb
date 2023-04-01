Rails.application.routes.draw do
  root to: 'chats#index'
  resources :chats, only: [:new, :create]
end
