Rails.application.routes.draw do
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"
  namespace :api do
    get '/profit_losses' => 'profit_losses#index'
    get '/profit_losses/revenue_query' => 'profit_losses#index_revenue_query'
    get '/profit_losses/direct_costs_query' => 'profit_losses#index_direct_costs_query'
  end 
end
