class AddDetailsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :shipping_address, :string
    add_column :users, :shipping_suburb, :string
    add_column :users, :shipping_zip, :integer
    add_column :users, :shipping_state, :string

    rename_column :users, :address, :billing_address
    rename_column :users, :suburb, :billing_suburb
    rename_column :users, :zip, :billing_zip
    rename_column :users, :state, :billing_state
  end
end
