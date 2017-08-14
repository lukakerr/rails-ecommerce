class AddImageToUsers < ActiveRecord::Migration[5.0]
  def up
    add_attachment :users, :image
  end

  def down
    remove_attachment :users, :image
  end
end
