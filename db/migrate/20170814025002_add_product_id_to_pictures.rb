class AddProductIdToPictures < ActiveRecord::Migration[5.0]
  def change
  	add_column :pictures, :product_id, :integer
  end
end
