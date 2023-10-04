Rails.application.routes.draw do
  root 'home#index'

  devise_for :users, :controllers => {
    registrations: "registrations"
  }

  resources :users
  get 'contact', to: 'contact#index'
  get 'publications', to: 'publications#index'
  get 'faqs', to: 'faqs#index'
  get 'pricing', to: 'pricing#index'
end
