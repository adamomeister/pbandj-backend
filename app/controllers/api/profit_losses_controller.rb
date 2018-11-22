class Api::ProfitLossesController < ApplicationController

  def index
    @profitlosses = ProfitLoss.all
    render 'index.json.jbuilder'
  end
end
