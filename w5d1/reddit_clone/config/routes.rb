Rails.application.routes.draw do
  resources :users, only: [:new, :create, :destroy]
  resource :session, only: [:new, :create, :destroy]
  resources :subs, except: [:destroy] do
    resources :posts, only: [:new]
  end
  resources :posts, except: [:index, :new] do
    resources :comments, only: [:new]
  end
  resources :comments, only: [:create, :show]


end
