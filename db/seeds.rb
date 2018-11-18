# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


inputData = [
  "3004 - Termite Treatments",  #revenue_name
  2018,                       #year
  28331.00,                           #january
  20297.00,                           #february
  32019.00,                           #march
  23393.00,                           #april
  19196.00,                           #may
  17513.00,                           #june
  22095.00,                           #july
  27954.00,                           #august
  20726.00,                           #september
  # ,                           #october
  # ,                           #november
  # ,                           #december
  # ,                           #total  
  ]


profit_loss = ProfitLoss.new(
  revenue_name: inputData[0],
  year: inputData[1],
  january: inputData[2],
  february: inputData[3],
  march: inputData[4],
  april: inputData[5],
  may: inputData[6],
  june: inputData[7],
  july: inputData[8],
  august: inputData[9],
  september: inputData[10],
  october: inputData[11],
  november: inputData[12],
  december: inputData[13],
  total: inputData[14],
  )

profit_loss.save