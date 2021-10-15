Rails.application.routes.draw do
  
    root 'users#home' #home

    resources :users

    

    resources :users, only: [:show] do 
    resources :reviews, only: [:index, :show, :new, :edit] 
  end

  resources :reviews

  resources :restaurants, except: [:new, :create, :edit, :update, :destroy]

  resources :restaurants, only: [:show, :index] do
    resources :reviews, only: [:show, :index]
  end
  
  

end


