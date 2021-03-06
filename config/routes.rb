Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :sessions, only: [:create]
      resources :registrations, only: [:create]
      resources :complaints, only: [:create, :show, :index, :update]
    end
  end

  delete :logout, to: "api/v1/sessions#logout"
  get :logged_in, to: "api/v1/sessions#logged_in"


  root to: "static#index"
end
