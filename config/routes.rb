Rails.application.routes.draw do
 get '/wishlists/:username', to: 'wishlists#index'
 get '/favoritelists/:username', to: 'favoritelists#index'
 delete '/wishlists/:username/:name', to: 'wishlists#destroy'
 delete '/favoritelists/:username/:name', to: 'favoritelists#destroy'
 post '/users/', to: 'users#create'
get '/get_current_user', to: 'application#grab_current_user'
get '/get_session_user', to: 'application#grab_session_user'
get '/logout', to: 'application#logout'
  resources :favoritelists, except: [:delete, :show]
  resources :wishlists, except: [:delete, :show]
  resources :users
end
