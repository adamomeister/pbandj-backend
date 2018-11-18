class CreateProfitLosses < ActiveRecord::Migration[5.2]
  def change
    create_table :profit_losses do |t|
      t.string :user_id
      t.string :revenue_name
      t.integer :year
      t.integer :january
      t.integer :february
      t.integer :march
      t.integer :april
      t.integer :may
      t.integer :june
      t.integer :july
      t.integer :august
      t.integer :september
      t.integer :october
      t.integer :november
      t.integer :december
      t.integer :total

      t.timestamps
    end
  end
end
