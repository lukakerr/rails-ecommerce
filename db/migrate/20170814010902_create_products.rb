class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :price, :precision => 8, :scale => 2
      t.decimal :old_price
      t.boolean :on_sale
      t.boolean :sold_out
      t.boolean :featured
      t.integer :quantity

      t.timestamps
    end
  end
end
