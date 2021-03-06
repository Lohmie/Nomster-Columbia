Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'places#index'
  resources :places
  resources :places do
    resources :comments, only: :create #nested routes
    resources :photos, only: :create #create new resources in app (photo)
  end
  resources :users, only: :show
end
