json.array! @profitlosses do |profitloss|
  json.row_id profitloss.id
  json.profit_loss_name profitloss.profit_loss_name
  json.year profitloss.year
  json.january number_to_currency(profitloss.january)
  json.february number_to_currency(profitloss.february)
  json.march number_to_currency(profitloss.march)
  json.april number_to_currency(profitloss.april)
  json.may number_to_currency(profitloss.may)
  json.june number_to_currency(profitloss.june)
  json.july number_to_currency(profitloss.july)
  json.august number_to_currency(profitloss.august)
  json.september number_to_currency(profitloss.september)
  json.october number_to_currency(profitloss.october)
  json.november number_to_currency(profitloss.november)
  json.december number_to_currency(profitloss.december)
  json.revenue_group_total_ytd number_to_currency(profitloss.revenue_group_total_ytd)
end