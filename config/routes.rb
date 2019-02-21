Rails.application.routes.draw do

  
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  post 'scheme' => "scarves#scheme", :as => :pull_scheme

  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  resources :scarves

  # get 'scheme', to: 'scarves#scheme', as: 'scheme'

  root "landing#index"

  get 'patterns/new'
  get 'patterns/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
