class ChangeIntsToDecimal < ActiveRecord::Migration[5.2]
  def change
    change_column :profit_losses, :january, :decimal, precision: 11, scale: 2
  end
end
