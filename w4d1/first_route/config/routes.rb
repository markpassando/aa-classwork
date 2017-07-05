Rails.application.routes.draw do
  #resources :users

  # user
  #get all
  get 'users/' => 'users#index'

  get 'users/:user_id/artworks' => 'users#index'

  #get all
  get 'users/:id' => 'users#show'

  #post
  post 'users/' => 'users#create'

  #get new user form
  get 'users/new' => 'users#new', :as => 'new_user'

  #get edit users
  get 'users/:id/edit' => 'users#edit'

  #patch update
  patch'users/:id' => 'users#update'

  #put update
  put 'users/:id' => 'users#update'

  #delete destroy
  delete 'users/:id' => 'users#destroy'


  # artworks
  #get all
  # get 'artworks/' => 'artworks#index'

  #get all
  get 'artworks/:id' => 'artworks#show'

  #post
  post 'artworks/' => 'artworks#create'

  #get new user form
  get 'artworks/new' => 'artworks#new', :as => 'new_artwork'

  #get edit artworks
  get 'artworks/:id/edit' => 'artworks#edit'

  #patch update
  patch'artworks/:id' => 'artworks#update'

  #put update
  put 'artworks/:id' => 'artworks#update'

  #delete destroy
  delete 'artworks/:id' => 'artworks#destroy'


  # artwork_shares
  get 'artwork_shares/' => 'artwork_shares#index'

  #get all
  get 'artwork_shares/:id' => 'artwork_shares#show'

  #post
  post 'artwork_shares/' => 'artwork_shares#create'

  #get new user form
  get 'artwork_shares/new' => 'artwork_shares#new', :as => 'new_artwork_share'

  #delete destroy
  delete 'artwork_shares/:id' => 'artwork_shares#destroy'
end
