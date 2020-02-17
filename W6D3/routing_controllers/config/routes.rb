Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get 'users', to: 'users#index' 
  # get 'users/new', to: 'users#new'
  # post 'users', to: 'users#create' 
  # get 'users/:id', to: 'users#show'
  # get 'users/:id/edit', to: 'users#edit'
  # patch 'users/:id', to: 'users#update'
  # delete 'users/:id', to: 'users#destroy'
  resources :users, only: [:update, :show, :create, :index, :destroy]
  resources :artworks, only: [:update, :show, :create, :destroy]
  resources :artwork_shares, only: [:create, :destroy]

  resources :users, only: [:update, :show, :create, :index, :destroy] do 
    resources :artworks, only: [:index]
  end
  resources :comments, only: [:index, :create, :destroy]


end
