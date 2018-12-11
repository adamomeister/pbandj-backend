class Api::ProfitLossesController < ApplicationController
  def index
    @profitlosses = ProfitLoss.all
    render 'index.json.jbuilder'
  end

  def show
    revenue_year = params[:year]
    @profitlosses = ProfitLoss.where(year: revenue_year)
    render 'index.json.jbuilder'
  end
end
