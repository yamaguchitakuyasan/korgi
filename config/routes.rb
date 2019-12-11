Rails.application.routes.draw do

  get 'home/index'

  devise_for :admins, controllers: {
  	sessions: 'admins/sessions',
  	passwords: 'admins/passwords',
  	registrations: 'admins/registrations'
  }
  devise_for :users, controllers: {
  	sessions: 'users/sessions',
  	passwords: 'users/passwords',
  	registrations: 'users/registrations'
  }

  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
  	resources :universities, :lectures
  end

  root 'home#index'

  get 'home/about'

  resources :lectures

  resource :favorites, only: [:create, :destroy]


end
