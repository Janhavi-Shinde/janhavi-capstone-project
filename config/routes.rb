Rails.application.routes.draw do
  #  # post '/auth/facebook/callback' => 'sessions#omniauthcreate'
  #  match '/auth/github/callback' => 'sessions#omniauthcreate', via: [:get, :post]
  #  # match '/auth/facebook/callback', to: 'sessions#omniauthcreate', via: [:get, :post]
  # root 'sessions#new'
  # resources :sessions
  # delete '/signout', to: 'sessions#destroy'

#resources :sessions, only: [:new, :create, :show]

  resources :spheres_goals
  
  resources :goals
  resources :spheres

  resources :users do
    resources :spheres 
  end
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
