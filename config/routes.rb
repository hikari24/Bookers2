Rails.application.routes.draw do
  root 'home#top'
  get "home/about" => "home#about"

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:show, :index, :edit, :new, :update]
  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]


end
