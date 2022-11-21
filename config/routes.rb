Rails.application.routes.draw do

  get "sign_up", to: "registrations#new"
  post "users", to: "registrations#create"

  get "/", to: "main#index"
end
