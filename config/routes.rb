Rails.application.routes.draw do
  namespace :api do
    resources :users
    resources :orders
    resources :order_inquiries
    resources :items

    resources :order_items, only: [:index, :show] do
      resources :orders, only: [:show, :index, :destroy]
    end

    #FIX THESE TWO LINES
    get "/get-current-user" => "sessions#get_current_user"
    post "/login" => "sessions#login"
  end

  

  get "*path", to: "fallback#index", constraints: ->(req) { !req.xhr? && req.format.html? }

end
