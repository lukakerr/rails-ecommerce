class AddSlugToCheckouts < ActiveRecord::Migration[5.0]
  def change
    add_column :checkouts, :slug, :string, null: false
    add_index :checkouts, :slug, unique: true
  end
end
