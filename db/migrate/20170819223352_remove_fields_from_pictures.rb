class RemoveFieldsFromPictures < ActiveRecord::Migration[5.0]
  def change
  	remove_column :pictures, :product_id
  	remove_column :pictures, :banner_id
  end
end
