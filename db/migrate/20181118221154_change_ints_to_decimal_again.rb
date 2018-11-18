class ChangeIntsToDecimalAgain < ActiveRecord::Migration[5.2]
  def change
    change_column :profit_losses, :february, :decimal, precision: 11, scale: 2
    change_column :profit_losses, :march, :decimal, precision: 11, scale: 2
    change_column :profit_losses, :april, :decimal, precision: 11, scale: 2
    change_column :profit_losses, :may, :decimal, precision: 11, scale: 2
    change_column :profit_losses, :june, :decimal, precision: 11, scale: 2
    change_column :profit_losses, :july, :decimal, precision: 11, scale: 2
    change_column :profit_losses, :august, :decimal, precision: 11, scale: 2
    change_column :profit_losses, :september, :decimal, precision: 11, scale: 2
    change_column :profit_losses, :october, :decimal, precision: 11, scale: 2
    change_column :profit_losses, :november, :decimal, precision: 11, scale: 2
    change_column :profit_losses, :december, :decimal, precision: 11, scale: 2
    change_column :profit_losses, :total, :decimal, precision: 11, scale: 2
  end
end
