Jcms::Application.routes.draw do
  opinio_model

  match 'tagged' => 'home#tagged', :as => 'tagged'

  match "/node/rss", :to => redirect("/texts/rss.rss")
  match "/node/view/:id", :to => redirect("/texts/%{id}")
  match "/node/view/", :to => redirect("/")
  match "/node/index", :to => redirect("/")
  match "/node/", :to => redirect("/")

  devise_for :users

  resources :users
  resources :licenses
  resources :owners
  resources :menus

  resources :home do
    collection do
      get 'search'
    end
  end

  resources :images do
    collection do
      get 'my'
      get 'rss'
      get 'search'
    end
  end

  resources :texts do
    opinio
    collection do
      get 'my'
      get 'rss'
      get 'search'
    end
  end

  get "home/index"

  root :to => 'home#index'
end
