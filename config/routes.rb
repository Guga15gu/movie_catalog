Rails.application.routes.draw do
  root 'home#index'

  get 'genre', to: 'genre#index'
  resources :movies, only: [:show, :new, :create]
end
