Rails.application.routes.draw do
  resources :users
  resources :orders

  resources :order_items, only: [:index, :show] do
    resources :orders, only: [:show, :index]
  end

  get "/get-current-user" => "sessions#get_current_user"
  post "/login" => "sessions#login"

end
