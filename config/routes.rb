Rails.application.routes.draw do
  devise_for :users
  root "customers#index"
  resources :customers do
    collection do
      get 'search'
    end
  end
end
