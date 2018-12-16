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
json.data @revenue_group_totals
json.labels @revenue_income_names
json.revenue_monthly_totals @revenue_monthly_totals
