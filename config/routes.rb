Rails.application.routes.draw do
  root "posts#index"

  get "/users/:user_id/following_posts", to: "posts#following", as: "following_posts"
  get "/post/:id/like", to: "posts#like", as: "like"
  get "/users/:user_id/followers", to: "follows#followers", as: "followers"
  get "/users/:user_id/followees", to: "follows#followees", as: "followees"

  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions",
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  resources :users, only: [ :show, :update, :edit, :index ] do
    resource :follow, only: [ :create, :destroy ], controller: "follows"
  end

  resources :posts do
    resources :likes, only: [ :create, :destroy ], controller: "likes"
    resources :comments
  end
end
