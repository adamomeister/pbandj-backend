# Load the excel file in .xls format
input_file = Spreadsheet.open '/users/christopherjadamo/Desktop/P&L01.01.16-YTD.xls'

# Load first sheet from excel file
input_sheet = input_file.worksheet 2

j = 1
while j <= 56
  # Set array to a specific row in the sheet
  input_row = input_sheet.row(j)

  # First value is the row title (string)
  input_data = [input_row[0]]

  i = 1

  while i <= 12
    if input_row[i] == nil
      input_data << 0
    else
      input_data << input_row[i]
    end
    i += 1
  end

  j += 1
  # pp input_data
  profit_loss = ProfitLoss.new(
    revenue_name: input_data[0],
    year: 2017,
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
    total: 0,
  )

  profit_loss.save
end
