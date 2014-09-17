NewsReader::Application.routes.draw do
  resources :users, only: [:new, :show, :create]
  resource :session, only: [:new, :destroy, :create]
  
  namespace :api do
    resources :feeds, only: [:index, :create, :show, :destroy] do
      resources :entries, only: [:index]
    end
  end

  root to: "static_pages#index"
end
