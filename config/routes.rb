Rails.application.routes.draw do
  root 'homes#top'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'users#show'

  resources :users, only: [:show, :index, :edit, :new]
  resources :books, only: [:new, :create, :index, :show, :destroy]

end
