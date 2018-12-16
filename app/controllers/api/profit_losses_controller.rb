class Api::ProfitLossesController < ApplicationController
  def index
    @profitlosses = ProfitLoss.all
    render 'index.json.jbuilder'
  end

  def index_revenue_query
    search_year = params[:year]
    search_pl_category = params[:category]
    search_pl_type = params[:type]
    revenue_incomes = ProfitLoss.where(
      year: search_year,
      profit_loss_category: search_pl_category,
      profit_loss_type: search_pl_type
    ).order(id: :asc)
    @revenue_monthly_totals = monthly_total(revenue_incomes)
    @revenue_group_totals = []
    @revenue_income_names = []
    revenue_incomes.each do |revenue_income|
      @revenue_group_totals << revenue_income.profit_loss_group_total_ytd
      @revenue_income_names << revenue_income.profit_loss_name
    end
    render 'index_rev_query.json.jbuilder'
  end

  def index_direct_costs_query
    search_year = params[:year]
    search_pl_category = params[:category]
    search_pl_type = params[:type]
    direct_costs = ProfitLoss.where(
      year: search_year,
      profit_loss_category: search_pl_category,
      profit_loss_type: search_pl_type
    ).order(id: :asc)
    @direct_costs_monthly_totals = monthly_total(direct_costs)
    @direct_costs_group_totals = []
    @direct_costs_names = []
    direct_costs.each do |direct_cost|
      @direct_costs_group_totals << direct_cost.profit_loss_group_total_ytd
      @direct_costs_names << direct_cost.profit_loss_name
    end
    render 'index_direct_cost_query.json.jbuilder'
  end
end
