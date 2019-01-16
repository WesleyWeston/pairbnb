Rails.application.routes.draw do
  
  root "users#index"
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  resources :listings do 
    resource :bookings
  end
  resources :users
  

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"

  # get '/search' => 'listings#search', as: 'search_listings'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  Clearance.configure do |config|
    config.routes = false

  end

end

