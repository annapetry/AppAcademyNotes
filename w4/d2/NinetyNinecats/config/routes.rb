NinetyNinecats::Application.routes.draw do
  resources :cats do
    resources :cat_rental_requests, only: [:new]
  end
  
  resources :cat_rental_requests, only: [:create, :new] do
    patch 'approve', to: 'cat_rental_requests#approve_request', as: 'approve'
    patch 'deny', to: 'cat_rental_requests#deny_request', as: 'deny'
  end
  
end
