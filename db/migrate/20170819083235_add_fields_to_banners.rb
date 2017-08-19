class AddFieldsToBanners < ActiveRecord::Migration[5.0]
  def change
  	add_column :banners, :name, :string
  end
end
