Rails.application.routes.draw do
  resources :appointments
  resources :fields
  
  
  root to: 'pages#home'
  get 'pages/error', to: 'pages#error'
  get '/:profile', to: 'profile#index', as: :user
  # post '/:profile', to: 'profile#appointments'
  get '/:profile/new', to: 'appointments#new'
  post '/:profile/new', to: 'appointments#create'

  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
