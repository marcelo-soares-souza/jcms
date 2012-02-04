Jcms::Application.routes.draw do
  devise_for :users

  resources :users
  resources :licenses
  resources :texts
  resources :images

  resources :rest do
   collection do
     get 'texts'
     get 'images'
   end
 end

  get "home/index"

  root :to => 'home#index'
end
