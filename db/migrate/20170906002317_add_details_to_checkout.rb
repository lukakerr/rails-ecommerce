class AddDetailsToCheckout < ActiveRecord::Migration[5.0]
  def change
    add_column :checkouts, :shipping_address, :string
    add_column :checkouts, :shipping_suburb, :string
    add_column :checkouts, :shipping_zip, :integer
    add_column :checkouts, :shipping_state, :string

    rename_column :checkouts, :address, :billing_address
    rename_column :checkouts, :suburb, :billing_suburb
    rename_column :checkouts, :zip, :billing_zip
    rename_column :checkouts, :state, :billing_state
  end
end