Rails.application.routes.draw do


  root "users#index"

  resources :users

  get 'sessions/new'

  get 'users/new'
 
  resources :users do
    resources :posts
  end

  resources :posts do
    resources :comments
  end

  get 'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  
end
