Jcms::Application.routes.draw do
  resources :menus

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
    collection do
      get 'my'
      get 'rss'
      get 'search'
    end
  end

  get "home/index"

  root :to => 'home#index'
end
