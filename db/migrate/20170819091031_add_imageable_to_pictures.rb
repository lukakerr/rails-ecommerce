class AddImageableToPictures < ActiveRecord::Migration[5.0]
  def change
    add_reference :pictures, :imageable, polymorphic: true, index: true
  end
end
