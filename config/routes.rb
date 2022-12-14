Rails.application.routes.draw do
  resources :room_messages
  resources :rooms
  #resources :posts
  
  root to: "main#index"
  
  get "/login", to: "main#index"
  post "/login", to: "registrations#check"

  get "/registration", to: "registrations#new"
  post "/registration", to: "registrations#create"

  delete "/logout", to: "sessions#destroy"
  
  #get "/sign_in", to: "sessions#new"
  #post "/sign_in", to: "sessions#create"
  
  resources :user
end
