class AddUserIdToBanners < ActiveRecord::Migration[5.0]
  def change
  	add_column :banners, :user_id, :integer
  end
end
