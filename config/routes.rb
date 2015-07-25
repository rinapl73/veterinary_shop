Rails.application.routes.draw do
  resources :appointments
  root to: 'visitors#index'

  devise_for :users, :controllers => { :registrations => "registrations" }

  resources :doctors
  get :dashboard, to: "visitors#dashboard"
  get :reminder, to: "appointments#reminder"

end
