Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show, :index]

  resource :session, only: [:new, :create, :destroy]

  resources :bands do
    resources :albums, only: [:new, :create]
  end

  resources :albums, except: [:new, :index, :create] do
    resources :tracks, only: [:new, :create]
  end

  resources :tracks, except: [:new, :index, :create]

end
