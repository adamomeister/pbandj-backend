Rails.application.routes.draw do
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"
  namespace :api do
    get '/profit_losses' => 'profit_losses#index'
    get '/profit_losses/search_term' => 'profit_losses#show'
  end 
end
