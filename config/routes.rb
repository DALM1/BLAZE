Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }

  resources :channels, only: [:index, :create] do
    resources :messages, only: [:create]
  end

  resources :posts, only: [:index, :create, :show]
  resources :notifications, only: [:index]

  mount ActionCable.server => '/cable'
end
