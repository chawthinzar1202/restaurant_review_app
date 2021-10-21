Rails.application.routes.draw do
 
  
    root 'users#home'

    resources :users

    get '/signup', to: "users#new"
    post '/signup', to: "users#create"
  
    get '/login' => 'sessions#new'
    post '/login' => 'sessions#create'
  
  
    delete '/logout' => 'sessions#destroy'
    

    resources :users, only: [:show] do 
    resources :reviews, only: [:index, :show, :new, :edit] 
  end

  resources :reviews

  resources :restaurants, except: [:new, :create, :edit, :update, :destroy]

  resources :restaurants, only: [:show, :index] do
    resources :reviews, only: [:show, :index]
  end
  get '/reviews/:id/review_data', to: 'reviews#review_data'

end


