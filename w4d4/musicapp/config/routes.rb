Rails.application.routes.draw do
  resources :users, only: [:create, :new, :show]
  resource :session, only: [:create, :destroy, :new]
  resources :bands, only: [:new, :create, :destroy, :index, :show] do
    resources :albums, only: [:new]
  end

  resources :albums, only: [:create, :destroy, :index, :show] do
    resources :tracks, only: [:new]
  end

  resources :tracks, only: [:create, :destroy, :index, :show] do
    resources :notes, only: [:new]
  end

  resources :notes, only: [:create, :destroy, :index, :show]
end
