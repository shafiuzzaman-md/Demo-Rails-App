Rails.application.routes.draw do
  get 'sessions/new'

  root "static_pages#home"
  get 'users/new'
 
  resources :posts do
    resources :comments
  end

  get 'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  resources :users
end
