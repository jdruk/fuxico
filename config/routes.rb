Rails.application.routes.draw do
  resources :messages
  resources :rooms
  resources :themes
  resources :groups
  devise_for :users
  root 'statics#homepage'
end
