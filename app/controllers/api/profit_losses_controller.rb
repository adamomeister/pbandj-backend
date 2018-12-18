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

  def update
    uploaded_io = params[:file]
    File.open(Rails.root.join('public', uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end
    # Load the excel file in .xls format
    input_file = Spreadsheet.open Rails.root.join('public', uploaded_io.original_filename)

    # Load first sheet from excel file
    input_sheet = input_file.worksheet 2
    
    input_row = input_sheet.row(1)[0]
    p input_row

    # j = 1
    # while j <= 56
    #   # Set array to a specific row in the sheet
    #   input_row = input_sheet.row(j)

    #   # First value is the row title (string)
    #   input_data = [input_row[0]]

    #   i = 1

    #   while i <= 12
    #     if input_row[i] == nil
    #       input_data << 0
    #     else
    #       input_data << input_row[i]
    #     end
    #     i += 1
    #   end

    #   j += 1
    #   # pp input_data
    #   profit_loss = ProfitLoss.new(
    #     revenue_name: input_data[0],
    #     year: 2017,
    #     january: input_data[1],
    #     february: input_data[2],
    #     march: input_data[3],
    #     april: input_data[4],
    #     may: input_data[5],
    #     june: input_data[6],
    #     july: input_data[7],
    #     august: input_data[8],
    #     september: input_data[9],
    #     october: input_data[10],
    #     november: input_data[11],
    #     december: input_data[12],
    #     total: 0,
    #   )

    #   profit_loss.save
    # end
  end
end