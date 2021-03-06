Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root 'homes#index'
  resources :items do
    resources :bids
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
