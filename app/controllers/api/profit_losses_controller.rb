class Api::ProfitLossesController < ApplicationController
  def index
    @profitlosses = ProfitLoss.all
    render 'index.json.jbuilder'
  end

  def show
    search_year = params[:year]
    search_pl_category = params[:category]
    search_pl_type = params[:type]
    @profitlosses = ProfitLoss.where(
      year: search_year,
      profit_loss_category: search_pl_category,
      profit_loss_type: search_pl_type
      ).order(id: :asc)
    render 'index.json.jbuilder'
  end
end
