Rails.application.routes.draw do
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"
  namespace :api do
    get '/profit_losses' => 'profit_losses#index'
    get '/profit_losses/profit_loss_query' => 'profit_losses#index_profit_loss_query'
    post '/profit_losses/file_upload' => 'profit_losses#update'
  end 
end
