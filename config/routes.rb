Uap::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
get "home/index"
  devise_for :users, :controllers => { registrations: "registrations" }
  resources :users
  resources :user_steps
  resources :search
  resources :readings, shallow: true do
    	resources :comments, :only => [:create, :destroy]  
  end
  root 'home#index'

end
