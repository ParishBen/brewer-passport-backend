Rails.application.routes.draw do
 get '/wishlists/:username', to: 'wishlists#index'
 get '/favoritelists/:username', to: 'favoritelists#index'
 delete '/wishlists/:username/:name', to: 'wishlists#destroy'
 delete '/favoritelists/:username/:name', to: 'favoritelists#destroy'
  resources :favoritelists
  resources :wishlists
  resources :breweries
  #get "/localhost:3000/logout", to: "users#destroy", as: "logout"
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
