Rails.application.routes.draw do
  root "posts#index"
  get "/post/:id/like", to: "posts#like", as: "like"

  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions",
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  resources :users, only: [ :show, :update, :edit ]
  resources :posts do
    resources :likes, only: [ :create, :destroy ]
    resources :comments
  end
end
