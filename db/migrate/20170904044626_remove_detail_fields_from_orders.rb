class RemoveDetailFieldsFromOrders < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :first_name
    remove_column :orders, :last_name
    remove_column :orders, :email
    remove_column :orders, :address
    remove_column :orders, :suburb
    remove_column :orders, :zip
    remove_column :orders, :state
    remove_column :orders, :phone
  end
end
