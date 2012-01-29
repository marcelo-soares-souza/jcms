Jcms::Application.routes.draw do
  resources :users
  resources :licenses
  resources :texts
  resources :images

  get "home/index"

  root :to => 'home#index'
end
