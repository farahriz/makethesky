Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  resources :users
  get 'patterns/new'
  get 'patterns/show'

  resources :scarves
  root "landing#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
