Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # root 'welcome#index'
  root 'posts#index'

  # To use Singular routes, use 'resource', instead of 'resources'
  resources :posts do
    resources :comments
  end

end
