Rails.application.routes.draw do
  resources :messages
  resources :rooms
  resources :themes
  resources :groups
  get '/leave/group/:id', to: 'groups#leave', as: 'leave_group'
  #devise_for :users
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  root 'statics#homepage'
end
