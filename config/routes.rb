Rails.application.routes.draw do

  root "contacts#index"

  get "auth/:provider/callback", to: "sessions#create"
  get "logout", to: "sessions#destroy"

end
