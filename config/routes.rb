PostitTemplate::Application.routes.draw do
  root to: 'posts#index'

  get "/register", to: "users#new"
  get "/login", to: "sessions#new"
  get "/logout" => "sessions#destroy", :as => "logout"
  post "/login", to: "sessions#create"

  resources :posts, except: [:destroy] do

    member do
      post "vote"
    end

  	resources :comments, only: [:create] do

      member do
        post "vote"
      end
    end
  end

  resources :categories, only: [:show, :create, :new]
  resources :users, only: [:show, :create, :edit, :update]
end
