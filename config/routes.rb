Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "products" => "products#index"
  post "products" => "products#create"
  get "products/:id" => "products#show"
  patch "products/:id" => "products#update"
  delete "products/:id" => "products#destroy"

  post "/users" => "users#create"

  post "/sessions" => "sessions#create"

  get "/carted_products" => "carted_products#index"
  post "/carted_products" => "carted_products#create"

end
