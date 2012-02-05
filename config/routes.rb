Jcms::Application.routes.draw do
  match "/node/view/:id", :to => redirect("/texts/%{id}")
  match "/node/view/", :to => redirect("/")
  match "/node/index", :to => redirect("/")
  match "/node/", :to => redirect("/")

  devise_for :users

  resources :users
  resources :licenses
  resources :texts
  resources :images
  resources :contents

  get "home/index"

  root :to => 'home#index'
end
