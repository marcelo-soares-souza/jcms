Jcms::Application.routes.draw do
  match "/node/rss", :to => redirect("/texts/rss.rss")
  match "/node/view/:id", :to => redirect("/texts/%{id}")
  match "/node/view/", :to => redirect("/")
  match "/node/index", :to => redirect("/")
  match "/node/", :to => redirect("/")

  devise_for :users

  resources :home do
    collection do
      get 'search'
    end
  end

  resources :users
  resources :licenses
  resources :images
  resources :owners
  resources :texts do
    collection do
      get 'rss'
      get 'search'
    end
  end

  get "home/index"

  root :to => 'home#index'
end
