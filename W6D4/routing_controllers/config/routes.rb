Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get 'users', to: 'users#index' 
  # get 'users/new', to: 'users#new'
  # post 'users', to: 'users#create' 
  # get 'users/:id', to: 'users#show'
  # get 'users/:id/edit', to: 'users#edit'
  # patch 'users/:id', to: 'users#update'
  # delete 'users/:id', to: 'users#destroy'
  
  
  resources :artwork_shares, only: [:create, :destroy]
  resources :collections, only: [:show]

  resources :users, only: [:update, :show, :create, :index, :destroy] do 
    resources :artworks, only: [:index]
    resources :likes, only:[:index]
    resources :collections, only:[:index] 
    member do 
      get 'favorites'
    end

  end

  resources :artworks, only: [:index, :update, :show, :create, :destroy] do 
    resources :likes, only:[:index]
    resources :collections, only:[:index]
  end
  
  resources :comments, only: [:index, :create, :destroy] do 
    resources :likes, only:[:index]
  end


  


end
