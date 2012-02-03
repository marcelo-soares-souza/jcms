Jcms::Application.routes.draw do
  devise_for :users

  resources :users
  resources :licenses
  resources :texts
  resources :images
  resources :beyonds

  get "home/index"

  root :to => 'home#index'
end
