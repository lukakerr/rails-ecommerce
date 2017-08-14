class RemovePicturesFromProducts < ActiveRecord::Migration[5.0]
  def change
  	remove_column :products, :pictures
  end
end
