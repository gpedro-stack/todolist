Rails.application.routes.draw do


  namespace :admin do
      resources :dolists
      resources :tasks
      resources :users

      root to: "dolists#index"
    end
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "dolists#index"

  resources :dolists do
    resources :tasks


  end

  # Defines the root path route ("/")
  # root "articles#index"
end
