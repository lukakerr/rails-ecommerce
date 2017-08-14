class RemovePictureIdToProducts < ActiveRecord::Migration[5.0]
  def change
  	remove_column :products, :picture_id
  end
end
