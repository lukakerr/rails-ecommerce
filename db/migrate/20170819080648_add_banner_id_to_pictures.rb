class AddBannerIdToPictures < ActiveRecord::Migration[5.0]
  def change
  	add_column :pictures, :banner_id, :integer
  end
end
