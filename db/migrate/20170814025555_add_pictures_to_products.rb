class AddPicturesToProducts < ActiveRecord::Migration[5.0]
  def change
  	add_column :products, :pictures, :text, array:true, default: []
  end
end
