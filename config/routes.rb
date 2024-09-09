Rails.application.routes.draw do
  root "posts#index"
  get "/post/:id/like", to: "posts#like", as: "like"

  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions",
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  resources :users, only: [ :show, :update, :edit ] do
    resource :follow, only: [ :create, :destroy ], controller: "follows"
  end

  resources :posts do
    resources :likes, only: [ :create, :destroy ], controller: "likes"
    resources :comments
  end
end
