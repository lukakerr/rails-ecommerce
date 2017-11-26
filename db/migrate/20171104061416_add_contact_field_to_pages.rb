class AddContactFieldToPages < ActiveRecord::Migration[5.0]
  def change
    add_column :pages, :contact_form, :boolean
  end
end
