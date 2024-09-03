Rails.application.routes.draw do
  root "posts#index"

  devise_for :users, controllers: { registrations: "users/registrations", sessions: "users/sessions" }

  resources :posts
  resources :users, only: [ :show ]
end
