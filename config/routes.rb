Rails.application.routes.draw do
  root 'home#index'
  get 'genres/index'
  get 'directors/index'
  get 'movies/index'

  resources :genres, only: [:show, :new, :create, :edit, :update, :destroy]
  resources :directors, only: [:show, :new, :create, :edit, :update, :destroy]
  resources :movies, only: [:show, :new, :create, :edit, :update, :destroy]
end
