class AddImageToUploads < ActiveRecord::Migration[5.0]
  def up
    add_attachment :uploads, :image
  end

  def down
    remove_attachment :uploads, :image
  end
end
