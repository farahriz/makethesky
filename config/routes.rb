Rails.application.routes.draw do
  get 'patterns/request'
  get 'patterns/result'
  get 'pattern/request'
  get 'pattern/result'
  resources :scarves
  root "landing#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
