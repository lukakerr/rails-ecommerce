class AddFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :address, :string
    add_column :users, :suburb, :string
    add_column :users, :zip, :integer
    add_column :users, :state, :string
    add_column :users, :phone, :string
    add_column :users, :admin, :boolean
  end
end
