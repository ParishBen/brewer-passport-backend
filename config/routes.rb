Rails.application.routes.draw do
 
  resources :favoritelists
  resources :wishlists
  resources :breweries
  get "/localhost:3000/logout", to: "users#destroy", as: "logout"
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
