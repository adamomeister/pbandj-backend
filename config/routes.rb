Rails.application.routes.draw do
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"
  get 'main/index'
  root 'main#index'
  resources :token

  get '/callback' => 'token#new'
  get '/:refresh_token/edit' => 'token#edit'

  namespace :api do
    get '/profit_losses' => 'profit_losses#index'
    get '/profit_losses/profit_loss_query' => 'profit_losses#index_profit_loss_query'
    post '/profit_losses/file_upload' => 'profit_losses#update'

    #user
    post "/users" => "users#create"
    post "/sessions" => "sessions#create"

  end
end
