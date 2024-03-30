Rails.application.routes.draw do
  root 'home#index'

  resources :genres, only: [:show, :new, :create, :edit, :update]
end
