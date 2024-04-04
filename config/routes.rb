Rails.application.routes.draw do
  root 'home#index'

  # constraints ->(request) { request.env["warden"].admin } do
    mount Avo::Engine, at: Avo.configuration.root_path
  # end

  devise_for :users, controllers: {
    registrations: 'registrations'
  }

  get 'subscription_status', to: 'subscriptions#status'

  resources :subscriptions, only: [:new, :create]

  resources :users

  # Admin authentication routes
  resources :admins, only: [:create]

  get "admin", to: "admins#new"
  post "admin", to: "admins#create"
  
  resources :publications do
    member do 
      post 'cite'
    end
  end

  resources :comments do
    resources :replies
  end

  resources :relationships, only: [:create, :destroy]

  # Show user profile
  get 'profile', to: 'users#show', as: :user_profile
  
  get 'contact', to: 'contact#index'
  get 'publications', to: 'publications#index'
  get 'faqs', to: 'faqs#index'
  get 'pricing', to: 'pricing#index'
  get 'privacy', to: 'privacy#index'
  get 'terms', to: 'terms#index'

end
