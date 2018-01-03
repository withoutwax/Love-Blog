Rails.application.routes.draw do
  # devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: { sessions: 'users/sessions' }

  # devise_for :users, :controllers => {:sessions => 'devise/sessions', :registrations => 'devise/regisrations'} do
  #   get "/login", :to => "users/sessions#new", :as => :login
  #   get "/signup", :to => "users/regisrations#new", :as => :signup
  #   get "/logout", :to => "users/sessions#destroy", :as => :logout
  # end


  # root 'welcome#index'
  root 'posts#index'

  # resources :users, only: [:show, :edit, :update]

  # To use Singular routes, use 'resource', instead of 'resources'
  resources :posts do
    resources :comments
  end

end
