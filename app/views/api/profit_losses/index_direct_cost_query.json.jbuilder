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
json.data @direct_costs_group_totals
json.labels @direct_costs_names
json.direct_costs_monthly_totals @direct_costs_monthly_totals
