Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  # namespace :api do
  #   get "/photos" => "photos#index"
  # end

  get "/checkout" => "checkout#index"

  get "/client_token" => "checkout#new"

  post "/client_token" => "checkout#noice"

end
