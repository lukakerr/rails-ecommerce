class AddImagesToPages < ActiveRecord::Migration[5.0]
  def up
    add_attachment :pages, :image
  end

  def down
    remove_attachment :pages, :image
  end
end
