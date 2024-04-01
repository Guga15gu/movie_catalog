Rails.application.routes.draw do
  get 'movie/index'
  root 'home#index'

  get 'genres/index'
  resources :genres, only: [:show, :new, :create, :edit, :update]
end
