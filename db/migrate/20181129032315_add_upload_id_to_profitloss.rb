class AddUploadIdToProfitloss < ActiveRecord::Migration[5.2]
  def change
        add_column :profit_losses, :upload_id, :integer
  end
end
