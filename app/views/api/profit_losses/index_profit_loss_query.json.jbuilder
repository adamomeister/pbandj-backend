# revenue data conversion
i = 0
@revenue_group_totals.length.times do 
  @revenue_group_totals[i] = '%.2f' % @revenue_group_totals[i]
  i += 1
end
j = 0
@revenue_monthly_totals.length.times do 
  @revenue_monthly_totals[j] = '%.2f' % @revenue_monthly_totals[j]
  j += 1
end

# direct costs data conversion
i = 0
@direct_costs_group_totals.length.times do 
  @direct_costs_group_totals[i] = '%.2f' % @direct_costs_group_totals[i]
  i += 1
end
j = 0
@direct_costs_monthly_totals.length.times do 
  @direct_costs_monthly_totals[j] = '%.2f' % @direct_costs_monthly_totals[j]
  j += 1
end

# fixed costs data conversion
i = 0
@fixed_costs_group_totals.length.times do 
  @fixed_costs_group_totals[i] = '%.2f' % @fixed_costs_group_totals[i]
  i += 1
end
j = 0
@fixed_costs_monthly_totals.length.times do 
  @fixed_costs_monthly_totals[j] = '%.2f' % @fixed_costs_monthly_totals[j]
  j += 1
end

# render revenue data
json.revenue_data @revenue_group_totals
json.revenue_labels @revenue_income_names
json.revenue_monthly_totals @revenue_monthly_totals

# render direct costs data
json.direct_costs_data @direct_costs_group_totals
json.direct_costs_labels @direct_costs_names
json.direct_costs_monthly_totals @direct_costs_monthly_totals

# render fixed costs data
json.fixed_costs_data @fixed_costs_group_totals
json.fixed_costs_labels @fixed_costs_names
json.fixed_costs_monthly_totals @fixed_costs_monthly_totals

#render profit data
json.yearly_total_revenue @yearly_total_revenue
json.yearly_total_direct_costs @yearly_total_direct_costs
json.yearly_gross_profit @yearly_gross_profit
json.yearly_gross_profit_percent @yearly_gross_profit_percent
json.yearly_net_income @yearly_net_income
json.yearly_net_income_percent @yearly_net_income_percent