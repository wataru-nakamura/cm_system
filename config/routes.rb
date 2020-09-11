Rails.application.routes.draw do
  devise_for :users
  root "customers#index"
  resources :customers do
    resources :comments, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
end
