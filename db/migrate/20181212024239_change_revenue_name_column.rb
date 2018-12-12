class ChangeRevenueNameColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :profit_losses, :revenue_name, :profit_loss_name
  end
end
