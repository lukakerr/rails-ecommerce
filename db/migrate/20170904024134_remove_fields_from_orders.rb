class RemoveFieldsFromOrders < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :product_id
    remove_column :orders, :product_name
  end
end