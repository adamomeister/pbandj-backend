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

    # earnings calculations
    # sum up monthly totals of revenue and direct costs
    @yearly_total_revenue = @revenue_monthly_totals.inject(0, :+)
    @yearly_total_direct_costs = @direct_costs_monthly_totals.inject(0, :+)
    @yearly_total_fixed_costs = @fixed_costs_monthly_totals.inject(0, :+)
    # calculate profits
    @yearly_gross_profit = @yearly_total_revenue - @yearly_total_direct_costs
    @yearly_gross_profit_percent = (@yearly_gross_profit /
      @yearly_total_revenue) * 100
    @yearly_net_income = @yearly_gross_profit - @yearly_total_fixed_costs
    @yearly_net_income_percent = (@yearly_net_income /
      @yearly_total_revenue) * 100

    render 'index_profit_loss_query.json.jbuilder'
  end

  def update
    uploaded_io = params[:file]
    File.open(Rails.root.join('public', uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end
    # Load the excel file in .xls format
    input_file = Spreadsheet.open Rails.root.join('public', uploaded_io.original_filename)

    worksheet_index = 0

    input_file.worksheets.count.times do
      # Load sheet from excel file
      input_sheet = input_file.worksheet worksheet_index
      input_sheet.each 2 do |row|
        cell_index = 0
        input_data = []
        row.length.times do
          if row[cell_index] == nil
            input_data << 0
          else
            input_data << row[cell_index]
          end
          cell_index += 1
        end
        profit_loss = ProfitLoss.new(
          profit_loss_name: input_data[0],
          january: input_data[1],
          february: input_data[2],
          march: input_data[3],
          april: input_data[4],
          may: input_data[5],
          june: input_data[6],
          july: input_data[7],
          august: input_data[8],
          september: input_data[9],
          october: input_data[10],
          november: input_data[11],
          december: input_data[12],
          year: input_data[13],
          profit_loss_category: input_data[14],
          profit_loss_type: input_data[15]
        )
        profit_loss.save
      end
      worksheet_index += 1
    end
  end
end