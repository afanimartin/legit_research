Rails.application.routes.draw do
  get 'users/show'
  root 'home#index'

  constraints ->(request) { request.env["warden"].user&.role_id == 1 } do
    mount Avo::Engine, at: Avo.configuration.root_path
  end

  devise_for :users, controllers: {
    omniauth_callbacks: 'omniauth_callbacks',
    sessions: 'sessions',
    registrations: 'registrations'
  }

  resources :publications

  # Show user profile
  get 'profile', to: 'users#show', as: :user_profile
  
  get 'contact', to: 'contact#index'
  get 'publications', to: 'publications#index'
  get 'faqs', to: 'faqs#index'
  get 'pricing', to: 'pricing#index'
  get 'privacy', to: 'privacy#index'
  get 'terms', to: 'terms#index'

end
