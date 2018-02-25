Rails.application.routes.draw do
  resources :calendars
  resources :users, only: [:new, :create, :edit, :update, :destroy]
  resources :events
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'home/index'

  root 'home#index'
end
