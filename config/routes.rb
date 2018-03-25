Rails.application.routes.draw do
  resources :employees
  resources :calendars do
    get :preferences
    post :preferences
    post :generate
  end
  devise_for :users
  resources :shifts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'home/index'

  root 'home#index'
end
