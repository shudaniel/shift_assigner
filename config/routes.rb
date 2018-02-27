Rails.application.routes.draw do
  resources :calendars
  devise_for :users
  resources :events, except: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'home/index'

  root 'home#index'
end
