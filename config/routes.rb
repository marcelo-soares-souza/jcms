Jcms::Application.routes.draw do
  resources :users
  resources :licenses
  resources :texts

  get "home/index"

  root :to => 'home#index'
end
