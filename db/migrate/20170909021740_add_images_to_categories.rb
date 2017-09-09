class AddImagesToCategories < ActiveRecord::Migration[5.0]
  def up
    add_attachment :categories, :image
  end

  def down
    remove_attachment :categories, :image
  end
end
