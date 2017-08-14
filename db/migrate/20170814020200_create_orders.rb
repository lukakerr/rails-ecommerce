class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.decimal :total
      t.decimal :tax
      t.decimal :gst
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :address
      t.string :suburb
      t.integer :zip
      t.string :state
      t.string :phone
      t.string :product_name
      t.integer :product_id
      t.integer :user_id

      t.timestamps
    end
  end
end
