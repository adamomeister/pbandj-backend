class Api::ProfitLossesController < ApplicationController
  def index
    @profitlosses = ProfitLoss.all
    render 'index.json.jbuilder'
  end

  def index_profit_loss_query
    # query
    search_year = params[:year]
    profit_losses_by_year = ProfitLoss.where(year: search_year).order(id: :asc)

    # data parse
    revenue_incomes = []
    direct_costs = []
    fixed_costs = []
    profit_losses_by_year.each do |profit_loss_by_year|
      if profit_loss_by_year.profit_loss_category == 'income' &&
         profit_loss_by_year.profit_loss_type == 'revenue'
        revenue_incomes << profit_loss_by_year
      elsif profit_loss_by_year.profit_loss_category == 'costs' &&
            profit_loss_by_year.profit_loss_type == 'direct'
        direct_costs << profit_loss_by_year
      elsif profit_loss_by_year.profit_loss_category == 'costs' &&
            profit_loss_by_year.profit_loss_type == 'fixed'
        fixed_costs << profit_loss_by_year
      end
    end

    # revenue data
    @revenue_monthly_totals = monthly_total(revenue_incomes)
    @revenue_group_totals = []
    @revenue_income_names = []
    revenue_incomes.each do |revenue_income|
      @revenue_group_totals << revenue_income.profit_loss_group_total_ytd
      @revenue_income_names << revenue_income.profit_loss_name
    end

    # direct costs data
    @direct_costs_monthly_totals = monthly_total(direct_costs)
    @direct_costs_group_totals = []
    @direct_costs_names = []
    direct_costs.each do |direct_cost|
      @direct_costs_group_totals << direct_cost.profit_loss_group_total_ytd
      @direct_costs_names << direct_cost.profit_loss_name
    end

    # fixed costs data
    @fixed_costs_monthly_totals = monthly_total(fixed_costs)
    @fixed_costs_group_totals = []
    @fixed_costs_names = []
    fixed_costs.each do |fixed_cost|
      @fixed_costs_group_totals << fixed_cost.profit_loss_group_total_ytd
      @fixed_costs_names << fixed_cost.profit_loss_name
    end
    render 'index_profit_loss_query.json.jbuilder'
  end
end