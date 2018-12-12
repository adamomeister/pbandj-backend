class AddPlCategoryToProfitLosses < ActiveRecord::Migration[5.2]
  def change
    add_column :profit_losses, :profit_loss_category, :string
  end
end
