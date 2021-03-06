Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "pages#dashboard"
  get "login" => "sessions#new", as: "login"
  post "login" => "sessions#create"
  get "logout" => "sessions#destroy", as: "logout"
  delete "logout" => "sessions#destroy"

  get "dashboard" => "pages#dashboard", as: "dashboard"

  resources :users, shallow: true do
    resources :subjects, shallow: true do
      resources :students
      resources :meetings, shallow: true do
        resources :attendances do
          collection do
            get "toggle"
          end

        end
      end
    end
  end
end
