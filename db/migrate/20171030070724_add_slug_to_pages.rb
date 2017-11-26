class AddSlugToPages < ActiveRecord::Migration[5.0]
  def change
    add_column :pages, :slug, :string, null: false
    add_index :pages, :slug, unique: true
  end
end
