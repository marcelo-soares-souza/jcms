Jcms::Application.routes.draw do
  match "/node/rss", :to => redirect("/texts/rss.rss")
  match "/node/view/:id", :to => redirect("/texts/%{id}")
  match "/node/view/", :to => redirect("/")
  match "/node/index", :to => redirect("/")
  match "/node/", :to => redirect("/")

  devise_for :users

  resources :users
  resources :licenses
  resources :images
  resources :contents
  resources :texts do
    collection do
      get 'rss'
    end
  end

  get "home/index"

  root :to => 'home#index'
end
