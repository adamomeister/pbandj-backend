class AddRowIdToProfitloss < ActiveRecord::Migration[5.2]
  def change
    add_column :profit_losses, :row_id, :integer
  end
end
