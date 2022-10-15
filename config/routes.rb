Rails.application.routes.draw do

  root "static_pages#home"
  get 'users/new'
 
  resources :posts do
    resources :comments
  end

  get 'signup'  => 'users#new'
  resources :users
end
