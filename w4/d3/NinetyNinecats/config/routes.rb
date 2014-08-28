NinetyNinecats::Application.routes.draw do
  resources :cats do
    resources :cat_rental_requests, only: [:new]
  end
  
  resources :cat_rental_requests, only: [:new, :create] do
    patch 'approve', to: 'cat_rental_requests#approve_request', as: 'approve'
    patch 'deny', to: 'cat_rental_requests#deny_request', as: 'deny'
  end
  
  resources :users, only: [:new, :create, :show]
  resource :session, only: [:new, :create, :destroy]
end
