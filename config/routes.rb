Rails.application.routes.draw do
  resources :personality_analyzes
  resources :trait_genres
  resources :genres
  resources :traits
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#index"	
end
