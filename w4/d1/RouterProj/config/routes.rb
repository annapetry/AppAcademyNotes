Rails.application.routes.draw do
  resources :users do
    resources :contacts, only: [:index]
    resources :comments
  end
  
  resources :contacts, except: [:index] do
    resources :comments
  end
  
  
  resources :contact_shares, only: [:create, :destroy] do
    resources :comments
  end
  
  
  
  
  
  
  get 'users/:id/contacts/favs' => 'contacts#showfavs',:as => 'user_favs'
  # get 'contactshares/favs' => 'contacts#showfavs'
  # post 'users/' => 'users#create'
  # get 'users/new' => 'users#new', :as => 'new_user'
  # get 'users/:id/edit' => 'users#edit', :as => 'edit_user'
  # get 'users/:id' => 'users#show', :as => 'user'
  # patch 'users/:id' => 'users#update'
  # put 'users/:id' => 'users#update'
  # delete 'users/:id' => 'users#destroy'
  
  
end
