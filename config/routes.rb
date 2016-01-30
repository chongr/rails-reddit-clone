Rails.application.routes.draw do

  resources :users, only: [:new, :create, :show]
  resource :sessions, only: [:new, :create, :destroy]
  resources :subs do
    resource :post, only: [:new, :create]
  end
  resources :posts, only: [:edit, :show, :update, :destroy]
end
