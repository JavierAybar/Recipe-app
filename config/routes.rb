Rails.application.routes.draw do
  devise_for :users
  root to: 'recipes#public'

  resources :users, only: [:index, :show] do 
    resources :recipes, only: [:public, :index, :new, :create, :destroy, :show, :toggle_public] do
      resources :shopping_lists, only: [:index]
      resources :recipe_foods, only: [:new, :create, :destroy]
      member do
        patch 'toggle_public'
      end
    end
    resources :foods, only: [:index, :new, :create, :destroy]
  end  

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
