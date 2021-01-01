Rails.application.routes.draw do
 get '/wishlists/:username', to: 'wishlists#index'
 get '/favoritelists/:username', to: 'favoritelists#index'
 delete '/wishlists/:username/:name', to: 'wishlists#destroy'
 delete '/favoritelists/:username/:name', to: 'favoritelists#destroy'

  resources :favoritelists, except: [:delete, :show]
  resources :wishlists, except: [:delete, :show]
 
  resources :users
end
