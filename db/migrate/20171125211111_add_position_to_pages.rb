class AddPositionToPages < ActiveRecord::Migration[5.0]
  def change
    add_column :pages, :position, :integer
  end
end
