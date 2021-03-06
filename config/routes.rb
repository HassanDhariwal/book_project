Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  root "books#index"
  resources :books
  
  root "authors#index"
  resources :authors

  resources :products do
    collection {post :import }
  end 
  root to: "products#index"
end
