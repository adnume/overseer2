Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  root "pages#home"
  get "login" => "sessions#new", as: "login"
  post "login" => "sessions#create"
  get "logout" => "sessions#destroy", as: "logout"
  delete "logout" => "sessions#destroy"

  get "dashboard" => "pages#dashboard", as: "dashboard"
end
