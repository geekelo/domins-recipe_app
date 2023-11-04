Rails.application.routes.draw do
  get 'general_shopping_lists/index'
  get 'recipe_foods/index'
  get 'recipe_foods/show'
  get 'recipe_foods/new'
  get 'recipe_foods/create'
  get 'recipe_foods/edit'
  get 'recipe_foods/update'
  get 'recipe_foods/destroy'
  get 'public_recipes/index'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :foods, only: [:index, :new, :create, :destroy]
  resources :foods
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  resources :public_recipes, only: [:index, :show]
 
  resources :recipe_foods, only: [:new, :create]

  # Defines the root path route ("/")
  root "public_recipes#index"

  resources :recipes do

    
    resources :recipe_foods
  end

  resources :recipes do
    member do
      patch 'toggle_public'
    end
  end
  
end
