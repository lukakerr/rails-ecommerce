class CreateCheckouts < ActiveRecord::Migration[5.0]
  def change
    create_table :checkouts do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :suburb
      t.integer :zip
      t.string :state
      t.string :phone
      t.decimal :total, :precision => 8, :scale => 2
      t.integer :user_id
      t.integer :order_id

      t.timestamps
    end
  end
end
