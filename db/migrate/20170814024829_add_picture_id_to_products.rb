class AddPictureIdToProducts < ActiveRecord::Migration[5.0]
  def change
  	add_column :products, :picture_id, :integer
  end
end
