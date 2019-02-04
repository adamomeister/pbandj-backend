Rails.application.routes.draw do
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"

  get '/callback' => 'api/token#new'  #intuit callback DOES THIS WORK? '/api/'?

  namespace :api do
    get '/profit_losses' => 'profit_losses#index'
    get '/profit_losses/profit_loss_query' => 'profit_losses#index_profit_loss_query'
    post '/profit_losses/file_upload' => 'profit_losses#update'

    #user
    post "/users" => "users#create"
    post "/sessions" => "sessions#create"

    #intuit tokens
    resources :token
    get '/:refresh_token/edit' => 'token#edit'
  end


end
