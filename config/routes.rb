Rails.application.routes.draw do
  #resources :posts
  
  #root to: "main#index"
  
  #get "/sign_up", to: "registrations#new"
  #post "/sign_up", to: "registrations#create"
  
  #delete "/logout", to: "sessions#destroy"
  
  #get "/sign_in", to: "sessions#new"
  #post "/sign_in", to: "sessions#create"
  
  resources :user
end
