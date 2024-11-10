Rails.application.routes.draw do
  resources :channels do
    resources :discussions do
      resources :messages, only: [:index, :create, :destroy]
    end
  end

  devise_for :users
end
