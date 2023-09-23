Rails.application.routes.draw do
  get 'registration/new'
  root 'home#index'

  devise_for :users

  resources :users
end
