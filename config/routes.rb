Rails.application.routes.draw do

  get 'card/new'
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
    resources :universities, :lectures, :users
  end

  resources :lectures, only: [:index, :show] do
    resource :favorites, only: [:create, :destroy]
    resource :reservations, only: [:create, :destroy]
  end

  root to: 'home#index'

  get 'home/about'

  get 'users/:id/mykorgi' => 'users#mykorgi', as: "mykorgi"

  resources :card, only: [:new, :show] do
  collection do
    post 'show', to: 'card#show'
    post 'pay', to: 'card#pay'
    post 'delete', to: 'card#delete'
  end
  end

  post 'pay', to: 'payment#pay'


end
