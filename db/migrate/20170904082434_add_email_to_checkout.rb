class AddEmailToCheckout < ActiveRecord::Migration[5.0]
  def change
    add_column :checkouts, :email, :string
  end
end
