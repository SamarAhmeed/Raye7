Rails.application.routes.draw do
  resources :pickups
  resources :trips
  root 'pages#home'
  resources :places
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
