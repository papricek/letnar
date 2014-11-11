Rails.application.routes.draw do

  root 'home#index'

  namespace :api do
    resources :categories
  end

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  get '*path', to: 'home#index'

end
