class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :company_name
      t.integer :address_id
      t.integer :admin_id
      t.timestamps
    end
  end
end
