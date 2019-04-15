Rails.application.routes.draw do
  resources :gas_stations
  resources :users
  put 'users/:id/nearby', to: 'users#nearby'
  get 'users/:id/nearby', to: 'users#nearbydefault'
  # match 'users/:id/nearby', to: 'users#nearby', via: :put
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
