Rails.application.routes.draw do

  resources :recipes, only: [:index, :new, :create, :destroy, :show ] do
    resources :recipe_foods, only: [:new, :create, :destroy]
  end
  resources :foods, only: [:index, :new, :create, :destroy ]
  resources :shopping_lists, only: [:index ]
  
  get 'public_recipes', to: 'recipes#public_recipes'
  get 'general_shopping_list', to: 'shopping_list#index'
  
  devise_for :users
  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
  end

  root to: "home#index"

end
